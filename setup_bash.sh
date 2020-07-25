#!/bin/sh

cp .bash_aliases ~/.
echo export EDITOR=vi >> ~/.bashrc
echo export PATH=~/.local/bin:\$PATH >> ~/.bashrc

cp .tmux.conf ~/.
cp -r .emacs.d ~/.
cp .vimrc ~/.
