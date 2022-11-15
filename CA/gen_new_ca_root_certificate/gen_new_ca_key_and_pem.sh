# 生成ca根证书私钥
openssl genrsa -out ca.key 2048

# 生成ca根证书请求文件
openssl req -new -key ./ca.key -out ca.csr -subj "/C=CN/ST=GuangDong/L=Guangzhou/O=xinglan/OU=xinglan/CN=www.xlipfs.com"

# 自签名
openssl x509 -req --days 36500 -in ca.csr -signkey ca.key -extfile ../../CA/openssl.cnf -extensions v3_ca -out ca.pem
