#!/bin/sh
crond -c /etc/crontabs/

nginx -g "daemon off;"