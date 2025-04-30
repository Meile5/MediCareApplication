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

// Sensor Setup
#define SENSOR_PIN 17
#define ECG_PIN 35  
OneWire oneWire(SENSOR_PIN);
DallasTemperature DS18B20(&oneWire);

WiFiClientSecure espClient;
PubSubClient client(espClient);

float tempC;

String deviceId = "DEVICE123";
String pairingCode = "";
bool isPaired = false;



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
  } else {
    Serial.println("No deviceId found, needs pairing");
    randomSeed(analogRead(0)); 
    pairingCode = generatePairingCode();
    reconnect();
    publishPairingCode();
  }

}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  if (Serial.available()) {
    char c = Serial.read();
    if (c == 'r') {
      resetPairing();
    }
  }

  if (isPaired) {
    DS18B20.requestTemperatures();
    tempC = DS18B20.getTempCByIndex(0);

    int ecgValue = analogRead(ECG_PIN);

    StaticJsonDocument<128> doc;
    doc["temperature"] = tempC;
    doc["ecg"] = ecgValue;

    String payload;
    serializeJson(doc, payload);

    String unifiedTopic = "medicare/patient/vitals/" + deviceId;
    client.publish(unifiedTopic.c_str(), payload.c_str());

    Serial.println("Publishing Vitals: " + payload);

    
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp:");
    lcd.print(tempC, 1);
    lcd.print((char)223);
    lcd.print("C");
    lcd.setCursor(0, 1);
    lcd.print("ECG:");
    lcd.print(ecgValue);
  }

  delay(5000);
}

