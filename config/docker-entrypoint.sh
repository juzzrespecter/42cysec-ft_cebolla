#!/bin/bash

rc-service nginx start
rc-service sshd start
rc-service tor start
tail -f /var/log/tor/debug.log