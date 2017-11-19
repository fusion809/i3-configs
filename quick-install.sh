#!/bin/bash

# Halt on errors
set -e
set -x

# Path variables
CFG="$HOME/GitHub/mine/configs"
I3="$CFG/i3-configs"

function checke {
    which $1 >/dev/null 2>&1 || (printf "$1 missing from $PATH" && exit 1)
}

# Check deps
checke ln -sf
checke feh
checke g++
checke git
checke i3bar
checke import
checke ln
checke mkdir
checke sudo
checke terminology
checke zsh

# Script assumes all deps are installed
if ! [[ -d $CFG ]]; then
    mkdir -p $CFG
fi

if ! [[ -d $I3 ]]; then
    git clone https://github.com/fusion809/i3-configs $I3
fi

###############################################################################
#################################### ~/.i3 ####################################
###############################################################################
if [[ -d $HOME/.i3 ]]; then
    rm -rf $HOME/.i3
fi

ln -sf -a $I3/.i3 $HOME

# Compile C++ programs
pushd $HOME/.i3
g++ -o cpu.o cpu.ln -sfp
g++ -o ram.o ram.ln -sfp
popd

# Set them up
if ! [[ -d /usr/local/bin ]]; then
    sudo mkdir -p /usr/local/bin
fi
sudo ln -sf $HOME/.i3/cpu.o /usr/local/bin/cpu
sudo ln -sf $HOME/.i3/ram.o /usr/local/bin/ram

###############################################################################
############################## ~/.i3status.conf ###############################
###############################################################################
ln -sf $I3/.i3status.conf $HOME

###############################################################################
################################ ~/.Xresources ################################
###############################################################################
ln -sf $I3/.Xresources $HOME

###############################################################################
################################# ~/.xsession #################################
###############################################################################
ln -sf $I3/.xsession $HOME

###############################################################################
################################ /usr/local/bin ###############################
###############################################################################
sudo ln -sf $I3/usr/local/bin/* /usr/local/bin
