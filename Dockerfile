FROM python:2-alpine
MAINTAINER CBRHerms

ENV MQTT_HOST="mqtthostip" \
    MQTT_USER="username" \
    MQTT_PASSWORD="password" \
    MQTT_TOPIC="freenas/ip"

ADD deps/crontab.txt /crontab.txt
ADD deps/publicip2mqtt.sh /publicip2mqtt.sh
COPY deps/entry.sh /entry.sh
RUN apk add --update bash && \
	apk add --update curl && \
	apk add --update perl && \
	apk add --update mosquitto mosquitto-clients && \
	rm -rf /var/cache/apk/* && \
	pip install speedtest-cli && \
	chmod +x publicip2mqtt.sh && \
	chmod +x entry.sh && \
	chmod +x crontab.txt && \
	crontab crontab.txt

CMD ["/entry.sh"]
