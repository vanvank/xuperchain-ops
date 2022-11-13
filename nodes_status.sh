#!/bin/bash
#set -x

./check_env.sh || exit 1

cd $CHAIN_BASE_DIR

end=$1
if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi

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
