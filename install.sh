#!/bin/bash

# Read README.md before running this.

echo "artistic-videos-util Getting a sudo ticket.. Read README.md before running this."
sudo echo "artistic-videos-util Done.."

echo "artistic-videos-util Downloading artistic-videos."
git clone https://github.com/manuelruder/artistic-videos ~/artistic-videos
cd ~/artistic-videos 

echo "artistic-videos-util Downloading VGG models."
sh models/download_models.sh

echo "artistic-videos-util Setting up DeepFlow2"
cd ~/artistic-videos
wget -v http://pascal.inrialpes.fr/data2/deepmatching/files/DeepFlow_release2.0.tar.gz -O ~/artistic-videos/DeepFlow_release2.0.tar.gz
tar -xzf ~/artistic-videos/DeepFlow_release2.0.tar.gz
cp ~/artistic-videos/DeepFlow_release2.0/deepmatching-static ~/artistic-videos
cp ~/artistic-videos/DeepFlow_release2.0/deepflow2-static ~/artistic-videos

echo "artistic-videos-util Setting up DeepMatching"
wget -v http://lear.inrialpes.fr/src/deepmatching/code/deepmatching_1.2.2.zip -O ~/artistic-videos/deepmatching_1.2.2.zip
cd ~/artistic-videos
unzip deepmatching_1.2.2.zip
cp deepmatching_1.2.2_c++/deepmatching-static ~/artistic-videos

echo "artistic-videos-util Installing dependencies."
echo "artistic-videos-util Installing torch, protobuf, cmake, libav-tools, openblas."
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:george-edison55/cmake-3.x
sudo apt-get update
sudo apt-get install -y libprotobuf-dev libopenblas-dev protobuf-compiler torch7-nv cmake libav-tools

echo "artistic-videos-util Installing loadcaffe."
sudo luarocks install loadcaffe

echo "artistic-videos-util Setting up directory structure."
mkdir -p ~/content
mkdir -p ~/styles

echo "artistic-videos-util Finished."

