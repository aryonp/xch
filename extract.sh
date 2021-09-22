#!/bin/bash
cd ~/chia-bockchain
. ./activate
chia plotnft show >> ~/xch/chia-plotnft.txt
chia keys show >> ~/xch/chia-keys.txt