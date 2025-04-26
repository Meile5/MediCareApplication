#include <Wire.h>        // I2C library (needed for LCD)
#include <LiquidCrystal_I2C.h>  // LCD library

#include <WiFi.h>
#include <WiFiClientSecure.h>  
#include <PubSubClient.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <ArduinoJson.h>

LiquidCrystal_I2C lcd(0x27, 16, 2); 
// Wi-Fi Credentials
const char* ssid = "GNX-A8D0";
const char* password = "AJRLR3LA3HTXAJ";

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

void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("ESP32Client", mqtt_user, mqtt_password)) {
      Serial.println("connected");
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

   
  randomSeed(analogRead(0)); 
  pairingCode = generatePairingCode();


  reconnect();
  publishPairingCode();
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  DS18B20.requestTemperatures();
  tempC = DS18B20.getTempCByIndex(0);
  String tempPayload = "{\"temperature\": " + String(tempC, 2) + "}";
  Serial.println("Publishing Temp: " + tempPayload);
  client.publish("medicare/patient/temperature", tempPayload.c_str());

  int ecgValue = analogRead(ECG_PIN);
  String ecgPayload = "{\"ecg\": " + String(ecgValue) + "}";
  Serial.println("Publishing ECG: " + ecgPayload);
  client.publish("medicare/patient/ecg", ecgPayload.c_str());

  delay(5000); // Publish every 5 seconds
}
