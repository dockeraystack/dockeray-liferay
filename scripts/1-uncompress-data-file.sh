#!/bin/sh

if [[ -f "/docker-entrypoint-init.d/data.tgz" ]]; then
    tar -xzvf /docker-entrypoint-init.d/data.tgz -C /opt/liferay
fi