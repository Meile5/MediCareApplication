#include <Wire.h>        
#include <LiquidCrystal_I2C.h>  

#include <WiFi.h>
#include <WiFiClientSecure.h>  
#include <PubSubClient.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <ArduinoJson.h>
#include <Preferences.h>

Preferences preferences;


LiquidCrystal_I2C lcd(0x27, 16, 2); 
// Wi-Fi Credentials
const char* ssid = "Veneco";
const char* password = "Chamo12345";

// HiveMQ Info
const char* mqtt_server = "8eb6b37a41cb487dad91a6a4e69e70de.s1.eu.hivemq.cloud"; 
const int mqtt_port = 8883; 
const char* mqtt_user = "MedicareDevice"; 
const char* mqtt_password = "MedicarePass492154";

// ecg setup stuff
#define SENSOR_PIN 17
#define ECG_PIN 35  
#define ECG_SAMPLE_INTERVAL 40 // milliseconds (25Hz)
#define ECG_AVG_GROUP_SIZE 5   // average every 5 samples

OneWire oneWire(SENSOR_PIN);
DallasTemperature DS18B20(&oneWire);

WiFiClientSecure espClient;
PubSubClient client(espClient);

float tempC;

String deviceId = "DEVICE123";
String pairingCode = "";
bool isPaired = false;

const int ECG_BATCH_SIZE = 100;  // collect 100 samples (4 seconds at 25Hz)
int ecgRawBuffer[ECG_BATCH_SIZE];
int ecgRawIndex = 0;

unsigned long lastSampleTime = 0;
unsigned long lastSendTime = 0;



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
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.println("] ");

  StaticJsonDocument<200> doc;
  DeserializationError error = deserializeJson(doc, payload, length);
  if (error) {
    Serial.println("Failed to parse MQTT message");
    return;
  }

  if (doc.containsKey("deviceId")) {
    deviceId = doc["deviceId"].as<String>();
    Serial.println("Received new deviceId: " + deviceId);
    isPaired = true;

    
    preferences.putString("deviceId", deviceId);
    Serial.println("deviceId saved to flash memory!");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Paired!");
    delay(5000);
    lcd.clear();
  }
}


void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("ESP32Client", mqtt_user, mqtt_password)) {
      Serial.println("connected");

      String topic = "medicare/pairing/" + pairingCode + "/assign";
      client.subscribe(topic.c_str());
      Serial.println("Subscribed to: " + topic);

    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
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

  Serial.println("Publishing Pairing Code JSON: " + output);

  client.publish("medicare/device/pairing-code", output.c_str());


  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Pair Code:");
  lcd.setCursor(0, 1);
  lcd.print(pairingCode);
}

String generatePairingCode() {
  //  4-digit random code
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

void sendVitalsIfReady() {
  if (millis() - lastSendTime >= 1500 && ecgRawIndex >= ECG_AVG_GROUP_SIZE) {
    DS18B20.requestTemperatures();
    tempC = DS18B20.getTempCByIndex(0);

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
    JsonArray ecgArray = doc.createNestedArray("ecg");

    for (int i = 0; i < avgSize; i++) {
      ecgArray.add(ecgAveraged[i]);
    }

    String payload;
    serializeJson(doc, payload);
    String topic = "medicare/patient/vitals/" + deviceId;
    client.publish(topic.c_str(), payload.c_str());
    Serial.println("Publishing Vitals Batch:\n" + payload);

    // Reset 
    ecgRawIndex = 0;
    lastSendTime = millis();

    // LCD Display 
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp:");
    lcd.print(tempC, 1);
    lcd.print((char)223);
    lcd.print("C");
    lcd.setCursor(0, 1);
    lcd.print("ECG Avg:");
    lcd.print(ecgAveraged[avgSize - 1]); 
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
   
  randomSeed(analogRead(0)); 
  pairingCode = generatePairingCode();


  if (deviceId != "") {
    Serial.println("Found saved deviceId: " + deviceId);
    isPaired = true;
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Device Paired!");
    delay(2000);
    lcd.clear();
    lcd.print("Connecting...");
  } else {
    Serial.println("No deviceId found, needs pairing");
    randomSeed(analogRead(0)); 
    pairingCode = generatePairingCode();
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
    sendVitalsIfReady();
  }

}

