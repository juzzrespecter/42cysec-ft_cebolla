#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/sshd start
/etc/init.d/tor start
## capado hasta ver que falla ##
## tail -f /var/log/tor/debug.log
tail -f /dev/null
