#!/bin/bash
#set -x
cd $CHAIN_BASE_DIR

end=$1

cd node1
echo
echo "****************** "
echo node1
bin/xchain-cli status -H 127.0.0.1:37101
echo
echo "****************** "
for i in $(seq 2 $end)
do
	echo node$i
	bin/xchain-cli status -H 127.0.0.1:3710$i
	echo
	echo "****************** "
done
