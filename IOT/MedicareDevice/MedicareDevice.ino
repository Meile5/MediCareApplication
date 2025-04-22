#include <OneWire.h>
#include <DallasTemperature.h>

#define SENSOR_PIN  17 

OneWire oneWire(SENSOR_PIN);
DallasTemperature DS18B20(&oneWire);

float tempC; 
float tempF; 

void setup() {
  Serial.begin(9600); 
  DS18B20.begin();    
}

void loop() {
  DS18B20.requestTemperatures();       
  tempC = DS18B20.getTempCByIndex(0);  
  tempF = tempC * 9 / 5 + 32; 

  Serial.print("Temperature: ");
  Serial.print(tempC);    
  Serial.print("°C");
  Serial.print("  ~  ");  
  Serial.print(tempF);    
  Serial.println("°F");

  delay(500);
}