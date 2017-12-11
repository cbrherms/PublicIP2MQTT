#!/bin/sh

# grab env variables
MQTT_HOST="${MQTT_HOST:-mqtthostip}"
MQTT_USER="${MQTT_USER:-username}"
MQTT_PASSWORD="${MQTT_PASSWORD:-password}"
MQTT_TOPIC="${MQTT_TOPIC:-freenas/ip}"

sed -i 's/MQTT_HOST="mqtthostip"/MQTT_HOST="'"${MQTT_HOST}"'"/g' publicip2mqtt.sh
sed -i 's/MQTT_USER="username"/MQTT_USER="'"${MQTT_USER}"'"/g' publicip2mqtt.sh
sed -i 's/MQTT_PASSWORD="password"/MQTT_PASSWORD="'"${MQTT_PASSWORD}"'"/g' publicip2mqtt.sh
sed -i 's#MQTT_TOPIC="freenas/ip"#MQTT_TOPIC="'"${MQTT_TOPIC}"'"#g' publicip2mqtt.sh

# start cron
/usr/sbin/crond -f -l 8
