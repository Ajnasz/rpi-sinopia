#!/bin/bash
if [ ! -f /opt/sinopia/config.yaml ]; then
# node /opt/sinopia/config_gen.js
	cp /opt/sinopia/node_modules/sinopia/conf/full.yaml /tmp/config.yaml
	sed -i 's/\#listen\: localhost/listen\: 0.0.0.0/' /tmp/config.yaml
	sed -e 's/allow_publish: admin/allow_publish: $authenticated/' /tmp/config.yaml > /opt/sinopia/config.yaml
	rm /tmp/config.yaml
fi
cat /opt/sinopia/config.yaml
node /opt/sinopia/node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
