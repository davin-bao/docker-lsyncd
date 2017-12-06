#!/usr/bin/env bash

touch /var/lsyncd.log;

lsyncd -log Exec /etc/lsyncd.conf

tail -f /var/lsyncd.log;
