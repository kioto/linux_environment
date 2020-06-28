#!/bin/sh

git config --global user.name "Kioto Hirahara"
git config --global user.email kioto.hirahara@gmail.com
git config --global credential.helper store

# git branchのlessを無効にする
git config --global pager.branch false

