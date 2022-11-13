#!/bin/bash
#set -x
cd $CHAIN_BASE_DIR
num=$1   # 第几个节点
if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作第3个node,就输入3: "
read num
fi

if [ -d node$num ]
then 
	echo node$num :"!!!此节点已存在,请确认后再操作"
	exit 11
fi

cp -r node1 node$num
cd node$num
rm -rf data/blockchain
rm -rf data/keys
./bin/xchain-cli account newkeys
rm -rf data/netkeys/cert.pem netkeys/private.key netkeys/net_private.key
./bin/xchain-cli netURL gen
./bin/xchain-cli netURL preview
./bin/xchain-cli netURL convert

echo "生成ca签名证书"
bash ca.sh $num
