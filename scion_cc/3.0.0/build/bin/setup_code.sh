#!/bin/bash

export WORKON_HOME='~/.virtualenvs'
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
mkvirtualenv --no-site-packages scion

source ~/.bash_profile

# Create virtualenv
workon scion
pip install setuptools --upgrade

# Get code
mkdir -p code
cd code
mkdir -p logs

git clone https://github.com/scionrep/scioncc
cd scioncc
git checkout ${GIT_REV:-master}
