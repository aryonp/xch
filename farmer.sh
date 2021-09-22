#!/bin/bash
$USR=
tmux new-session -d -s farming "flexfarmer -c /home/$USR/xch/config.yml"