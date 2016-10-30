#!/bin/sh

git submodule init
git submodule update

ln -s $HOME/dotfiles/.z* /root
ln -s $HOME/dotfiles/.vim* /root
mkdir $HOME/.vimbackup
