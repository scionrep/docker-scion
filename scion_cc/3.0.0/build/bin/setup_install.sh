#!/bin/bash

source ~/.bash_profile

workon scion
cd code/scioncc

# Buildout dependencies
python bootstrap.py -v 2.3.1
bin/buildout install extras

bin/generate_interfaces
