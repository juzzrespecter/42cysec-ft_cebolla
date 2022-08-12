#!/bin/bash

openrc
/etc/init.d/nginx start
/etc/init.d/sshd start
tail -f /dev/null
