#!/bin/sh

git config --global user.name "Kioto Hirahara"
git config --global user.email kioto.hirahara@gmail.com
git config --global credential.helper store

# git branchのlessを無効にする
#git config --global pager.branch false

# lessで画面クリアしない
git config --global core.pager "less -R -F -X"

# pullの時はデフォルトでrebase
git config pull.rebase true

