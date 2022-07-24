#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/sshd start
## capado hasta ver que falla ##
## tail -f /var/log/tor/debug.log
tail -f /dev/null
