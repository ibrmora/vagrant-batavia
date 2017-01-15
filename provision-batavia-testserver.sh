#! /bin/bash


set -v

#############################################################
export PYENV_ROOT="/home/vagrant/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


echo "$( pwd )"
cd /pybee/batavia
echo "$( pwd )"

echo $VIRTUAL_ENV
echo "$(python --version)"
. /pybee/venv/bin/activate
echo $VIRTUAL_ENV
echo "$(python --version)"
#############################################################


# 5- Lastly, compile the Batavia library and bundle it’s dependencies:
npm run build


# http://batavia.readthedocs.io/en/latest/intro/tutorial-1.html
# Tutorial: Deploying a Hello World application in the Batavia Sandbox

# Prerequisites

# A pybee directory with a Batavia checkout,
echo "$( pwd )"
# /pybee/batavia

# An activated Python 3.4 virtual environment
echo $VIRTUAL_ENV
# /pybee/venv
echo "$( pyenv which python )"
# /home/vagrant/.pyenv/versions/3.4.5/bin/python

# Batavia installed in that virtual environment
pip list
# batavia (3.4.0-dev.15, /pybee/batavia)
# pip (1.5.4)
# setuptools (2.2)


# Starting the test server

# 1- To start the test server, you’ll need to be in the testserver directory under the batavia directory:
cd testserver

# 2- Once you’re in the testserver directory, you can install the requirements for the test server:
pip install -r requirements.txt

# 3- Then you can start the test server
python manage.py runserver 0.0.0.0:8000
