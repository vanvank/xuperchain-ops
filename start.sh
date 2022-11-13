#!/bin/bash

cd $CHAIN_BASE_DIR
end=$1

if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi

cd node1
bash control.sh start
for i in $(seq 2 $end)
do
	cd ../node$i
	bash control.sh start
done
