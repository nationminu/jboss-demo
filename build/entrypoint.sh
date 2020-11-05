#!/usr/bin/env bash
CONTAINER_IP=`hostname -I`
${JBOSS_HOME}/bin/domain.sh -Djboss.bind.address=${CONTAINER_IP} -Djboss.bind.address.management=${CONTAINER_IP}