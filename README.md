# UnityHub-Ubuntu-Installer

With this script you can install the official UnityHub on your Ubuntu machine.

## Instructions on how to run the script using your terminal.

* First make sure that you have git installed

        $ sudo apt install git -y

* Install the script

        $ git clone https://github.com/AndreasKarageorgos/UnityHub-Ubuntu-Installer.git

* Change your directory to the script folder.

        $ cd UnityHub-Ubuntu-Installer/

* Make the script executable

        $ chmod +x UnityHub-installer.sh

* Run the script as root

        $ sudo ./UnityHub-installer.sh

Or you can use this all in one command (Do not use the command below if you have already used the commands above.):

        $ sudo apt update && sudo apt install git -y && git clone https://github.com/AndreasKarageorgos/UnityHub-Ubuntu-Installer.git && cd UnityHub-Ubuntu-Installer/ && chmod +x UnityHub-installer.sh && clear && echo "Starting The script" && sudo ./UnityHub-installer.sh