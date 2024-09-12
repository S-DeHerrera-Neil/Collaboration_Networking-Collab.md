#!/bin/bash
# command syntax ./ping_sweep_v2 X.X.X
# only give first three octets
echo "ping scan for ${i}.1-255" > ping_result
for i in {1..255} ; do ping -c 3 -l 3 ${1}.$i >> ping_result & done
echo "ping_sweep_v2"
echo -n "loading"
sleep 0.3s
echo -n ". "
sleep 0.3s
echo -n ". "
sleep 0.3s
echo ". "
cat ping_result | grep -P -B 1 -e '[1-9] received' | grep -P -o -e '(\d{1,3}\.){3}\d{1,3}' | sort
