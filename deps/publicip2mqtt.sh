#!/bin/bash

MQTT_HOST="mqtthostip"
MQTT_USER="username"
MQTT_PASSWORD="password"
MQTT_TOPIC="freenas/ip"

PUBLIC_IP=$(curl ifconfig.co)
# Raw message to MQTT
echo "$PUBLIC_IP"  | /usr/bin/mosquitto_pub -h $MQTT_HOST -u "$MQTT_USER" -P "$MQTT_PASSWORD" -r -l -t "$MQTT_TOPIC"
