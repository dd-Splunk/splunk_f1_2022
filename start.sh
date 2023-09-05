#!/bin/bash

# type "exit" to exit

stty -echoctl # hide ^C

# function called by trap
ctrl_c() {
    tput setaf 1
    printf "\rSIGINT caught      "
    tput sgr0
    sleep 1
    printf "\rEnter player name (exit) >>> "
}

trap 'ctrl_c' SIGINT

event="pi-f1"
player=""

while true
do
    printf "\rEnter player name (exit) >>> "
    read  player
    [[ $player == exit ]] && break
    python3 F1_2022_Conference_ingest.py --hostname pi-f1 --o11y yes --splunk yes --mode solo --player ${event}_${player}

done
