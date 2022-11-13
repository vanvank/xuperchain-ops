#!/bin/bash
set -x
end=$1
for i in $(seq 2 $end)
do
	cp node1/data/genesis/xuper.json node$i/data/genesis/xuper.json
done
