#!/bin/bash

jmeter -n -t /testplan.jmx -l /results.log ${PARAMS}

cat /results.log
RESULT=$(grep -c false /results.log)
echo -e "\nNumber of errors:" $RESULT "\n"
if [ "$RESULT" = "0" ]; then
    exit 0
else
    exit 1
fi
