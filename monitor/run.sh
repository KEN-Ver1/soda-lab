#!/bin/sh

BASE_DIR=/usr/local/http-monitor
TELEGRAF_CONFIG_DIR=/etc/telegraf/telegraf.conf
#
# Config telegraf
#
if [ ! -z ${TELEMETRY_DEST} ]
then
    cp $BASE_DIR/telegraf/telegraf.conf $TELEGRAF_CONFIG_DIR
    sed -i -e  "s/localhost:8086/$TELEMETRY_DEST:8086/g" $TELEGRAF_CONFIG_DIR
else
    echo "Please set TELEMETRY_DEST. Exiting..."
    exit 0
fi

#
# Start rero
#
if [ ! -z ${HTTP_DEST} ]
then
    sed -i -e  "s/localhost:80/$HTTP_DEST:80/g" $TELEGRAF_CONFIG_DIR
else
    echo "Please set HTTP_DEST. Exiting..."
    exit 0
fi

#
# Start telegraf
#
echo "Starting telegraf..."
telegraf && echo "Telegraf started successfully..."
