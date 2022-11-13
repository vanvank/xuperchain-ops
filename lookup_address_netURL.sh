#!/bin/bash
#set -x
end=$1
echo
cd node1
echo node1
more data/keys/address
./bin/xchain-cli netURL preview
echo
for i in $(seq 2 $end)
do
	cd ../node$i
	echo node$i
	more data/keys/address
	./bin/xchain-cli netURL preview
	echo
done
