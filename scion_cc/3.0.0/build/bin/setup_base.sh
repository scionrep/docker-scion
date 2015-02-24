#!/bin/bash

# Define shell environment
cat <<EOF >> ~/.bash_profile
export HOME=/root
export PYTHONPATH=.
export WORKON_HOME='~/.virtualenvs'
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon scion
cd
EOF

# Initialize virtualenv for the first time
export WORKON_HOME='/root/.virtualenvs'
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
