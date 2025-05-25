#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <ArduinoJson.h>
#include <Preferences.h>
#include "MAX30105.h"
#include "spo2_algorithm.h"


Preferences preferences;
MAX30105 particleSensor;

LiquidCrystal_I2C lcd(0x27, 16, 2);

// Wi-Fi Credentials
const char* ssid = "Veneco";
const char* password = "Chamo12345";

// HiveMQ Info
const char* mqtt_server = "8eb6b37a41cb487dad91a6a4e69e70de.s1.eu.hivemq.cloud";
const int mqtt_port = 8883;
const char* mqtt_user = "MedicareDevice";
const char* mqtt_password = "MedicarePass492154";

// ECG setup
#define SENSOR_PIN 17
#define ECG_PIN 35
#define ECG_SAMPLE_INTERVAL 40
#define ECG_AVG_GROUP_SIZE 5

OneWire oneWire(SENSOR_PIN);
DallasTemperature DS18B20(&oneWire);

WiFiClientSecure espClient;
PubSubClient client(espClient);

float tempC;

String deviceId = "DEVICE123";
String pairingCode = "";
bool isPaired = false;

const int ECG_BATCH_SIZE = 100;
int ecgRawBuffer[ECG_BATCH_SIZE];
int ecgRawIndex = 0;

unsigned long lastSampleTime = 0;
unsigned long lastSendTime = 0;

// HR/SpO2 buffers
#define MAX_SAMPLES 100
uint32_t irBuffer[MAX_SAMPLES];
uint32_t redBuffer[MAX_SAMPLES];
int bufferIndex = 0;
int32_t hr = 0;
int32_t spo2 = 0;
int8_t validHR = 0;
int8_t validSpO2 = 0;

void setup_wifi() {
  delay(10);
  Serial.println("Connecting to WiFi...");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("WiFi connected!");
}

void mqttCallback(char* topic, byte* payload, unsigned int length) {
  StaticJsonDocument<200> doc;
  DeserializationError error = deserializeJson(doc, payload, length);
  if (error) return;

  if (doc.containsKey("deviceId")) {
    deviceId = doc["deviceId"].as<String>();
    isPaired = true;
    preferences.putString("deviceId", deviceId);
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Paired!");
    delay(5000);
    lcd.clear();
  }
}

void reconnect() {
  while (!client.connected()) {
    if (client.connect("ESP32Client", mqtt_user, mqtt_password)) {
      String topic = "medicare/pairing/" + pairingCode + "/assign";
      client.subscribe(topic.c_str());
    } else {
      delay(2000);
    }
  }
}

void publishPairingCode() {
  StaticJsonDocument<128> doc;
  doc["deviceId"] = deviceId;
  doc["pairingCode"] = pairingCode;

  String output;
  serializeJson(doc, output);
  client.publish("medicare/device/pairing-code", output.c_str());

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Pair Code:");
  lcd.setCursor(0, 1);
  lcd.print(pairingCode);
}

String generatePairingCode() {
  int code = random(1000, 9999);
  return String(code);
}

void resetPairing() {
  preferences.remove("deviceId");
  deviceId = "";
  isPaired = false;
  pairingCode = generatePairingCode();
  publishPairingCode();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Reset Done!");
  lcd.setCursor(0, 1);
  lcd.print("Please restart");
  delay(3000);
}

void collectECGData() {
  if (millis() - lastSampleTime >= ECG_SAMPLE_INTERVAL) {
    if (ecgRawIndex < ECG_BATCH_SIZE) {
      ecgRawBuffer[ecgRawIndex++] = analogRead(ECG_PIN);
    }
    lastSampleTime = millis();
  }
}

void collectHeartRateData() {
  if (bufferIndex < MAX_SAMPLES) {
    redBuffer[bufferIndex] = particleSensor.getRed();
    irBuffer[bufferIndex] = particleSensor.getIR();
    bufferIndex++;
  }

  if (bufferIndex >= MAX_SAMPLES) {
   maxim_heart_rate_and_oxygen_saturation(irBuffer, MAX_SAMPLES, redBuffer,
                                       &spo2, &validSpO2, &hr, &validHR);

    bufferIndex = 0;
  }
}

void sendVitalsIfReady() {
  if (millis() - lastSendTime >= 1500 && ecgRawIndex >= ECG_AVG_GROUP_SIZE) {
    DS18B20.requestTemperatures();
    tempC = DS18B20.getTempCByIndex(0);
    collectHeartRateData();

    int avgSize = ecgRawIndex / ECG_AVG_GROUP_SIZE;
    int ecgAveraged[avgSize];
    for (int i = 0; i < avgSize; i++) {
      long sum = 0;
      for (int j = 0; j < ECG_AVG_GROUP_SIZE; j++) {
        sum += ecgRawBuffer[i * ECG_AVG_GROUP_SIZE + j];
      }
      ecgAveraged[i] = sum / ECG_AVG_GROUP_SIZE;
    }

    StaticJsonDocument<512> doc;
    doc["temperature"] = tempC;

    if (validHR && validSpO2) {
      doc["heartRate"] = hr;
      doc["spo2"] = spo2;
    } else {
      doc["heartRate"] = nullptr;
      doc["spo2"] = nullptr;
    }

    JsonArray ecgArray = doc.createNestedArray("ecg");
    for (int i = 0; i < avgSize; i++) {
      ecgArray.add(ecgAveraged[i]);
    }

    String payload;
    serializeJson(doc, payload);
    String topic = "medicare/patient/vitals/" + deviceId;
    client.publish(topic.c_str(), payload.c_str());

    ecgRawIndex = 0;
    lastSendTime = millis();

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp:");
    lcd.print(tempC, 1);
    lcd.print((char)223);
    lcd.print("C");
    lcd.setCursor(0, 1);
    lcd.print("HR:");
    lcd.print(hr);
    lcd.print(" SpO2:");
    lcd.print(spo2);
  }
}

void setup() {
  Serial.begin(9600);
  lcd.init();
  lcd.backlight();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Booting...");

  DS18B20.begin();
  setup_wifi();

  espClient.setInsecure();
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(mqttCallback);

  preferences.begin("medicare", false);
  deviceId = preferences.getString("deviceId", "");
  pairingCode = generatePairingCode();

  // Initialize MAX30102
  if (!particleSensor.begin(Wire, I2C_SPEED_STANDARD)) {
    Serial.println("MAX30102 not found. Check wiring.");
    lcd.clear();
    lcd.print("MAX30102 FAIL");
    while (1);
  }

  particleSensor.setup(); 
  particleSensor.setPulseAmplitudeRed(0x0A);
  particleSensor.setPulseAmplitudeIR(0x0A);

  if (deviceId != "") {
    isPaired = true;
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Device Paired!");
    delay(2000);
    lcd.clear();
    lcd.print("Connecting...");
  } else {
    reconnect();
    publishPairingCode();
  }
}

void loop() {
  if (!client.connected()) reconnect();
  client.loop();

  if (Serial.available()) {
    char c = Serial.read();
    if (c == 'r') resetPairing();
  }

  if (isPaired) {
    collectECGData();
    collectHeartRateData();
    sendVitalsIfReady();
  }
}
