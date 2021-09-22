#!/bin/bash

PLOT=1
THREAD=10
TMP_DIR=
TMP_DIR2=
DEST=
CKEY=
FKEY=

sudo swapoff -a 
tmux new-session -d -s plotting "chia_plot -n $PLOT -r $THREAD -t $TMP_DIR -2 $TMP_DIR2 -d $DEST -c $CKEY -f $FKEY"