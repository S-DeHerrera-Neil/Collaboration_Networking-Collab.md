#!/bin/bash
echo "scanning ${1} on ports ${2} thru ${3}" > scan_result
for ((i=${2};i<=${3};i++)); do
	timeout 0.5 echo -n 2>/dev/null < /dev/tcp/${1}/${i} && echo "port ${i} open" >> scan_result || echo "port ${i} closed" >> scan_result &
	if [[ $(expr ${i} % 1000) -eq 0 ]]; then
		echo "scanning ${1} port ${i} of ${3}"
	fi
done
sleep 1s
grep -P -e "scan|open" scan_result
