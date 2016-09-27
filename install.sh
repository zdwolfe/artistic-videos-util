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

echo "Downloading artistic-videos."
git clone https://github.com/manuelruder/artistic-videos ~/artistic-videos
cd ~/artistic-videos 

echo "Downloading VGG models."
sh models/download_models.sh


echo "Setting up DeepFlow2"
cd ~/artistic-videos
wget -v http://pascal.inrialpes.fr/data2/deepmatching/files/DeepFlow_release2.0.tar.gz -O ~/artistic-videos/DeepFlow_release2.0.tar.gz
tar -xzf ~/artistic-videos/DeepFlow_release2.0.tar.gz
cp ~/artistic-videos/DeepFlow_release2.0/deepmatching-static ~/artistic-videos
cp ~/artistic-videos/DeepFlow_release2.0/deepflow2-static ~/artistic-videos


echo "Setting up directory structure."
mkdir -p ~/content
mkdir -p ~/styles

echo "Finished."

