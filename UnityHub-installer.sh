#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

sudo apt update
sudo apt install wget -y
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
sudo apt install ./libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
sudo rm libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb

wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
sudo apt update
sudo apt install unityhub -y

clear

echo "UnityHub is installed on your System."
echo "To remove it type 'sudo apt remove unityhub'"
