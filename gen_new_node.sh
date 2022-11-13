#!/bin/bash
set -x
num=$1
cp -r node1 node$num
cd node$num
rm -rf data/keys
./bin/xchain-cli account newkeys
rm -rf data/netkeys/cert.pem netkeys/private.key netkeys/net_private.key
./bin/xchain-cli netURL gen
#./bin/xchain-cli netURL preview
./bin/xchain-cli netURL convert

cd /data/xuperchain5.2/xuperchain
bash ca.sh $num
