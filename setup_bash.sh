#!/bin/sh

cp .bash_aliases ~/.
echo export EDITOR=vi >> ~/.bashrc

cp .tmux.conf ~/.
cp -r .emacs.d ~/.
cp .vimrc ~/.

