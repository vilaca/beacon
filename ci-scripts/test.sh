#!/usr/bin/env bash
set -euo pipefail

echo -e ">>>\tTest:"
CONTAINER_ID="$(docker run -dp 8080:8080 --name beacon-test $1)"
echo -e "\tContainer running."
sleep 2
IP=$(docker inspect "$CONTAINER_ID" | jq -r '.[0].NetworkSettings.IPAddress')
echo -e "\tGot container ip [$IP]."
OK="$(docker run --rm -t curlimages/curl -- http://$IP:8080)"
echo "<<< Service replied [$OK]."
docker stop "$CONTAINER_ID"
docker rm "$CONTAINER_ID"
if [ "$OK" != "OK" ]; then
    echo "!!! Failure."
    exit 1
fi
echo "<<< Success."
