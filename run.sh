#!/bin/bash

if [ -z "${MONGO_DB_URL}" ] ;then
echo "MONGO_DB_URL is not specified"
exit 1
fi

host ${MONGO_DB_URL}
if [ $? -ne 0 ] ;then
echo "Unable to resolve host name"
fi

while true ;
do
nc -i 10 -z ${MONGO_DB_URL} 27017
if [ $? -ne 0 ] ;then
    echo "Port not yet opened up"
    sleep 30
    continue
fi
mongo -host ${MONGO_DB_URL} < users.js
mongo -host ${MONGO_DB_URL} < catalogue.js
exit $?
done