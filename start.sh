#!/bin/bash

end=$1
cd node1
bash control.sh start
for i in $(seq 2 $end)
do
	cd ../node$i
	bash control.sh start
done
