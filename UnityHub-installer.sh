#!/bin/bash

check_internet() {
    ping -c 1 google.com > /dev/null 2>&1
}

if [ "$EUID" -ne 0 ]; then
    echo "This script needs to be run with root privileges. Please enter your password."
    sudo "$0" "$@"  # Re-run the script with sudo
    exit $?
fi

if ! check_internet; then
    echo "No internet access. Exiting the script."
    exit 1
fi

echo "Updating packages..."
sudo apt update 1> /dev/null 2> /dev/null
echo "Done."



while true; do
    echo "Do you want to also install C# (dotnet-sdk) to your system ? (yes/no)"
    read answer

    case "$answer" in
        yes)
            echo "Installing C# (dotnet-sdk) to your system."
            sudo apt install apt-transport-https -y 1> /dev/null 2> /dev/null
            sudo apt install dotnet-sdk-8.0 -y 1> /dev/null 2> /dev/null
            echo "Done."
            break
            ;;
        no)
           break
            ;;
        *)
            echo "Invalid input. Please enter 'yes' or 'no'."
            ;;
    esac
done

echo "Installing UnityHub..."
sudo apt install wget -y 1> /dev/null 2> /dev/null
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list' 1> /dev/null 2> /dev/null
sudo apt update 1> /dev/null 2> /dev/null
sudo apt install unityhub -y 1> /dev/null 2> /dev/null

echo "Done."

echo "UnityHub is installed on your System."
echo "To remove it type 'sudo apt remove unityhub'"