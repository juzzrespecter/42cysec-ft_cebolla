#!/bin/bash

openrc
/etc/init.d/tor start
tail -f /dev/null
