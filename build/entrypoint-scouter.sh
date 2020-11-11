#!/usr/bin/env bash
cd /usr/local/rockPM && java -Xmx512m -jar /usr/local/rockPM/rockPM-web-1.0.0.jar &
cd ${SCOUTER_HOME}/ && java -Xmx1024m -classpath ${SCOUTER_HOME}/scouter-server-boot.jar scouter.boot.Boot ${SCOUTER_HOME}/lib