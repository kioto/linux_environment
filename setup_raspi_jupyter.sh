#!/bin/sh

jupyter_dir=~/jupyter

sudo pip3 install jupyter

if [ ! -d $jupyter_dir ]; then
    mkdir -p $jupyter_dir
fi

jupyter notebook --generate-config

cat <<EOF >> ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir = '$jupyter_dir'
c.NotebookApp.token = 'password'
EOF

# cd $jupyter_dir ; jupyter notebook

