#!/bin/bash

/etc/init.d/tor start
## capado hasta ver que falla ##
## tail -f /var/log/tor/debug.log
tail -f /dev/null
