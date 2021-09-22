#!/bin/bash

OS=linux
ARC=amd64
VER=v1.1.0

#Update flexfarmer
cd ~ 
wget -c https://static.flexpool.io/dl/flexfarmer/flexfarmer-$OS-$ARC-$VER.tar.gz
tar -xvf flexfarmer-$OS-$ARC-$VER.tar.gz
sudo mv flexfarmer/flexfarmer /usr/bin/
rm -rf flexfarmer/