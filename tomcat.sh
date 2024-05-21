#!/bin/bash
if ! systemctl status tomcat.service > /dev/null; then
  /usr/local/tomcat9/bin/startup.sh
fi
