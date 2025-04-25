#include <WiFi.h>
#include <WiFiClientSecure.h>  // Must be added manually
#include <PubSubClient.h>
#include <OneWire.h>
#include <DallasTemperature.h>

// Wi-Fi Credentials
const char* ssid = "Veneco";
const char* password = "Chamo12345";

// HiveMQ  Info
const char* mqtt_server = "8eb6b37a41cb487dad91a6a4e69e70de.s1.eu.hivemq.cloud"; 
const int mqtt_port = 8883; 
const char* mqtt_user = "MedicareDevice"; 
const char* mqtt_password = "MedicarePass492154";

// Sensor Setup
#define SENSOR_PIN 17
OneWire oneWire(SENSOR_PIN);
DallasTemperature DS18B20(&oneWire);

WiFiClientSecure espClient;
PubSubClient client(espClient);

float tempC;

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

void setup() {
  Serial.begin(9600);
  DS18B20.begin();
  setup_wifi();

  
  espClient.setInsecure(); 

  client.setServer(mqtt_server, mqtt_port);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  DS18B20.requestTemperatures();
  tempC = DS18B20.getTempCByIndex(0);

  String payload = "{\"temperature\": " + String(tempC, 2) + "}";
  Serial.println("Publishing: " + payload);

  client.publish("medicare/patient/temperature", payload.c_str());

  delay(5000); // Publish every 5 seconds
}
