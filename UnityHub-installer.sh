#!/bin/bash

apt update
apt install wget -y
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
apt install ./libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb

wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
apt update
apt install unityhub