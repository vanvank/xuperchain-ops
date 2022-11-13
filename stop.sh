#!/bin/bash
end=$1
cd node1
bash control.sh stop
for i in $(seq 2 $end)
do
cd ../node$i
bash control.sh stop
done
