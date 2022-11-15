# xuperchain-ops
百度超级链运维操作脚本
`git clone https://github.com/vanvank/xuperchain-ops.git`  

`cd xuperchain-ops`

# 设置链节点所在的目录CHAIN_BASE_DIR
比如默认make testnet生成的testnet目录所在的路径为：/data/xuperchain/testnet   

则在/etc/profile中添加  

`export CHAIN_BASE_DIR=/data/xuperchain/testnet`   

然后执行source是的环境变量生效   

`source /etc/profile`



# 生成CA根证书和签名客户端证书

## 生成CA根证书

`cd CA/gen_new_ca_root_certificate`

`./gen_new_ca_key_and_pem.sh`

拷贝证书和秘钥到CA文件夹下（慎重，因为会覆盖原有的CA根证书）

`cp ca.* ../`

将ca.pem拷贝到节点123的data/netkeys目录下

`cd ..`

`bash copy_ca.pem_to_nodes.sh 3`

## 给node123签名私钥

`cd ..`

`./ca.sh 1`

`./ca.sh 2`

`./ca.sh 3`

启动节点

`./start.sh 3`

查看节点状态

`./nodes_status.sh 3`





