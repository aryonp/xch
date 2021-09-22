#!/bin/bash

#Update madMAx plotter
cd ~/chia-plotter
git checkout master
git pull
git submodule update --init
./make_devel.sh
sudo mv build/chia_plot /usr/bin/