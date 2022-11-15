#!/bin/bash
./check_env.sh || exit 1

end=$1
if [[ -z $1 ]];then
echo -n "请输入node num, 比如要操作前3个node,就输入3: "
read end
fi

mkdir -p backup_keys
cd backup_keys

for i in $(seq 1 $end)
do
mkdir -p node$i/data
cp $CHAIN_BASE_DIR/node$i/data/keys -r node$i/data
cp $CHAIN_BASE_DIR/node$i/data/netkeys -r node$i/data
echo "node$i"
more node$i/data/keys/address
echo
done

