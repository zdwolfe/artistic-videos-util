#!/bin/bash

# Read README.md before running this.

echo "Getting a sudo ticket.. Read README.md before running this."
sudo echo "Done.."

echo "Installing dependencies."

mkdir ~/libjpeg
cd ~/libjpeg
wget http://www.ijg.org/files/jpegsrc.v8d.tar.gz
tar -xvf jpegsrc.v8d.tar.gz
cd jpeg-8d/ 
sudo ./configure
sudo make
sudo make install

curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; ./install.sh -b
source ~/.bashrc

echo "Installing protobuf."
sudo yum install -y protobuf-compiler protobuf-devel
luarocks install loadcaffe

echo "Downloading neural-style."
git clone https://github.com/jcjohnson/neural-style ~/neural-style
cd ~/neural-style 

echo "Downloading VGG models."
sh models/download_models.sh

echo "Setting up directory structure."
mkdir -p ~/content
mkdir -p ~/styles

echo "Finished."

