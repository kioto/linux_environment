#!/bin/sh

sudo apt install -y emacs ibus-mozc emacs-mozc \
     vim tmux graphviz doxygen \
     fonts-inconsolata

sudo fc-cache -fv
