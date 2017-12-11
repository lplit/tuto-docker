#!/bin/bash
set -e
docker build -t bomb bomb > /dev/null
docker rm -f bomb > /dev/null || true
source plantTheBomb.sh
docker run --name=bomb ${SAFE_OPTION} bomb 2>&1 | grep -v fork &
until [ "`docker inspect --format '{{ .State.Status }}' bomb 2>/dev/null`" == "running" ]; do :; done
echo "Defusing the bomb"
./defuseTheBomb.sh `docker inspect --format '{{ .State.Pid }}' bomb`
docker wait bomb > /dev/null
if [ "`docker inspect bomb --format='{{.State.ExitCode}}'`" -eq 0 ]
then
    echo "Counter Terrorist win"
else
    echo "Terrorists win"
fi
