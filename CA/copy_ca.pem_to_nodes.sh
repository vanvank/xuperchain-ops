#!/bin/bash
../check_env.sh || exit 1

end=$1

for i in $(seq 1 $end)
do
	cp ca.pem $CHAIN_BASE_DIR/node$i/data/netkeys/cacert.pem
done
