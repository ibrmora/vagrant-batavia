#! /bin/bash


set -v

export DEBIAN_FRONTEND=noninteractive


# Install dependencies from apt
sudo apt-get update
sudo apt-get upgrade -yq

# dependencies for pyenv & virtualenv
sudo apt-get install -yq make build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
      libncursesw5-dev xz-utils git python-virtualenv curl


# add nodejs PPA
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh


# Install nodejs & pandoc
sudo apt-get install -yq nodejs pandoc

node -v
# v6.9.4


# Install and configure pyenv
git clone https://github.com/yyuu/pyenv.git /home/vagrant/.pyenv


printf 'export LC_ALL=C
export PYENV_ROOT="/home/vagrant/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" \n ' >> ~/.bashrc

# Because environment variables in .bashrc not activated during Vagrant provisioning
# http://stackoverflow.com/questions/29569573/updating-bashrc-and-environment-variables-during-vagrant-provisioning
export PYENV_ROOT="/home/vagrant/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# for python 3.4.5 to avoid "locale.Error: unsupported locale setting"
# http://stackoverflow.com/questions/36394101/pip-install-locale-error-unsupported-locale-setting/36394262
export LC_ALL=C

pyenv install 3.4.5
# Installed Python-3.4.5 to /home/vagrant/.pyenv/versions/3.4.5


echo "$( pwd )"
# /home/vagrant



# http://batavia.readthedocs.io/en/latest/intro/tutorial-0.html
# Getting Started


# 1- Setup a pybee folder to store everything
rm -rf /pybee/*
cd /pybee
pyenv local 3.4.5

# 2- Get a copy of the Batavia code by running a git clone:
git clone https://github.com/pybee/batavia

# 3- We’ll need to create a virtual environment, and install Batavia into it.
echo "$( pyenv which python )"
# /home/vagrant/.pyenv/versions/3.4.5/bin/python

virtualenv -p $(pyenv which python) venv

. venv/bin/activate

cd batavia

pip install -e .


# 4- In addition, you need to install `Node.js`_. You need to have a recent version of Node;
# we test using v6.9.1. Once you’ve installed node,
# you can use it to install Batavia’s Javascript dependencies, and compile the Batavia library:
npm install
