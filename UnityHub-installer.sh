#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script needs to be run with root privileges. Please enter your password."
    sudo "$0" "$@"  # Re-run the script with sudo
    exit $?
fi

sudo apt update
sudo apt install wget -y
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
sudo apt install ./libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
sudo apt update
sudo apt install unityhub -y

clear

echo "UnityHub is installed on your System."
echo "To remove it type 'sudo apt remove unityhub'"
echo ""

while true; do
    echo "Do you want to also install C# (dotnet-sdk) to your system ? (yes/no)"
    read answer

    case "$answer" in
        yes)
            echo "Continuing..."
            sudo apt install apt-transport-https -y
            sudo apt install dotnet-sdk-7.0 -y
            clear
            echo "Done !"
            echo "Type 'dotnet --version' to verify the installation"
            break
            ;;
        no)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid input. Please enter 'yes' or 'no'."
            ;;
    esac
done


