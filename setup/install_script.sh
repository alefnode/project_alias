#!/bin/bash

<<<<<<< HEAD

# Check if cloned repository is in correct PATH
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
if [[ "$SCRIPTPATH" != "$HOME/project_alias/setup" ]]; then
    GIT_PATH=$(echo $SCRIPTPATH | sed "s/\/setup//g")
    echo ""
    echo "########################"
    echo "Incorrect Git clone PATH"
    echo "Actual: $GIT_PATH"
    echo "Should be: $HOME/project_alias"
    echo "########################"
    echo ""
    exit 1
fi


echo ""
echo "# Upgrade before start"
echo ""
sudo apt update -y -q
sudo apt upgrade -y -q
=======
echo ""
echo "# Upgrade before start"
echo ""
sudo apt update -y -qq
sudo apt ugprade -y -qq
>>>>>>> master

echo ""
echo "# Enable SPI module"
echo ""
sudo sed -i "s/#dtparam=spi/dtparam=spi/g" /boot/config.txt

echo ""
<<<<<<< HEAD
echo "# Enable pi user console autologin (needed to communicate to dbus)"
echo ""
sudo systemctl set-default multi-user.target
sudo ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo bash -c 'cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf << EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin pi --noclear %I \$TERM
EOF'

echo ""
echo "# Install python basic tools"
echo ""
sudo apt install -q -y python3-dev python3-pip git libatlas-base-dev
=======
echo "# Install python basic tools"
echo ""
sudo apt install -qq -y python3-dev python3-pip git libatlas-base-dev
>>>>>>> master

echo ""
echo "# Install ReSpeaker driver"
echo ""
cd $HOME
git clone https://github.com/respeaker/seeed-voicecard.git
cd seeed-voicecard
sudo ./install.sh

echo ""
echo "# Disable default soundcard"
echo ""
echo "blacklist snd_bcm2835" | sudo tee -a /etc/modprobe.d/alsa-blacklist.conf

echo ""
echo "# Installing python dependencies"
echo ""
sudo pip3 install spidev
<<<<<<< HEAD
sudo apt install -y -q python python-dev python-pip build-essential swig git libpulse-dev libasound2-dev pulseaudio pulseaudio-utils libpulse-dev libpulse-java libpulse0
=======
sudo apt install -y -qq python python-dev python-pip build-essential swig git libpulse-dev libasound2-dev pulseaudio pulseaudio-utils libpulse-dev libpulse-java libpulse0
>>>>>>> master
sudo pip3 install --upgrade pocketsphinx

echo ""
echo "# Install espeak"
echo ""
<<<<<<< HEAD
sudo apt -y -q install espeak
=======
sudo apt -y -qq install espeak
>>>>>>> master

echo ""
echo "# Install flask"
echo ""
sudo pip3 install flask flask_socketio

echo ""
echo "# Install pygame"
echo ""
<<<<<<< HEAD
sudo apt install -y -q python3-pygame
=======
sudo apt install -y -qq python3-pygame

echo ""
echo "# Clone project_alias repository"
echo ""
cd $HOME
git clone --single-branch --branch fix-google-tts https://github.com/alefnode/project_alias.git
cd project_alias
>>>>>>> master

echo ""
echo "# Change alias service and install on systemd"
echo ""
<<<<<<< HEAD
cd $HOME/project_alias
=======
>>>>>>> master
sudo cp alias.service /lib/systemd/system/
sudo systemctl enable alias.service
echo ""
echo "####################"
echo "# Executing REBOOT #"
echo "####################"
echo ""
sudo reboot


