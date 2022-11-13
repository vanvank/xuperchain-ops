#!/bin/bash


if [[ -z $1 ]];then
echo -n "请输入node num, 比如第3个node,就输入3: "
read node
fi

node=$CHAIN_BASE_DIR/node$1

openssl req -new \
-config CA/openssl.cnf \
-subj "/C=CN/ST=BJ/L=BJ/O=Baidu/OU=BlockChain/CN=node/emailAddress=helloworld@baidu.com" \
-key $node/data/netkeys/private.key \
-out $node/data/netkeys/cert.csr

openssl x509 -req -sha256 -days 3650 \
-CA CA/ca.pem -CAkey CA/ca.key -CAcreateserial \
-extfile CA/openssl.cnf -extensions v3_req \
-in $node/data/netkeys/cert.csr \
-out $node/data/netkeys/cert.pem
