#ifndef MY_SENSORS_GW_MQTT_H
#define MY_SENSORS_GW_MQTT_H

void ICACHE_FLASH_ATTR startMqttClient();
void ICACHE_FLASH_ATTR checkMqttClient();
void ICACHE_FLASH_ATTR mqttPublishMessage(String topic, String message);
void ICACHE_FLASH_ATTR mqttRegisterHttpHandlers(HttpServer &server);

#endif //MY_SENSORS_GW_MQTT_H
