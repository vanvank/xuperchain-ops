#!/bin/bash
#set -x
cd $CHAIN_BASE_DIR
end=$1
if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi
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
