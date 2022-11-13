#!/bin/bash

./check_env.sh || exit 1

cd $CHAIN_BASE_DIR
end=$1

if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi

for i in $(seq 2 $end)
do
	rm -rf node$/data/blockchain
done

echo "保险起见，第一个节点的data未删，请手动删除"
echo "手动执行: rm -rf $CHAIN_BASE_DIR/node1/data/blockchain"
