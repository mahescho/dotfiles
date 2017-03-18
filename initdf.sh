#!/bin/sh

git submodule init
git submodule update

ln -s $HOME/dotfiles/.z* $HOME
ln -s $HOME/dotfiles/.vim* $HOME
mkdir $HOME/.vimbackup


unamestr = $(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   chsh -s /usr/bin/zsh
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   chsh -s /usr/local/bin/zsh
fi
