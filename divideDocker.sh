#!/bin/bash
# Author: Burak Karaduman <burak.karaduman@kocsistem.com.tr>
# Usage: sh divideDocker.sh

# List app table
psql -U qradar -c "select id, name, status from installed_application"

# Input target app
echo -e "Please input an app id: \c"
read appid

# Get Container ID
docker ps | grep $appid | awk '{print $1}' >> junk

containerID=$(cat junk)
rm -f junk

# Divide into Docker Container
docker exec -it $containerID /bin/bash