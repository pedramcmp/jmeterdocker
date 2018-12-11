#!/bin/bash

jmeter -n -t /smoke.jmx -l /results.log -Jprot=${JPROT} -JIP=${JIP} -Jport=${JPORT}

RESULT=$(grep false /results.log | wc -l)
cat /results.log
if [ "$RESULT" = "0" ]; then
    exit 0
else
    exit 1
fi