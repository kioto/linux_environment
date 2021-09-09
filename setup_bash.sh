#!/bin/sh

cp .bash_aliases ~/.
echo export EDITOR=vi >> ~/.bashrc
echo export PATH=~/.local/bin:\$PATH >> ~/.bashrc
echo export PS1=\"\\h:\\W \\u\\$ \" >> ~/.bashrc

cp .tmux.conf ~/.
cp -r .emacs.d ~/.
cp .vimrc ~/.
