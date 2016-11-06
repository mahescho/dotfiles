#!/bin/sh

git submodule init
git submodule update

ln -s $HOME/dotfiles/.z* $HOME
ln -s $HOME/dotfiles/.vim* $HOME
mkdir $HOME/.vimbackup

chpass -s /usr/local/bin/zsh
