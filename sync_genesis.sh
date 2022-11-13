#!/bin/bash
# 同步创世块配置，从node1拷贝到其他节点

set -x
cd $CHAIN_BASE_DIR

end=$1

if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi
for i in $(seq 2 $end)
do
	cp node1/data/genesis/xuper.json node$i/data/genesis/xuper.json
done
