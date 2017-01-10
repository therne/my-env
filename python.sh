#!/bin/sh
echo Installing python 3...
brew install python3

echo Linking python3 to default...


echo Installing required packages...
pip3 install flask requests

echo Installing numpy
git clone https://github.com/numpy/numpy.git
cd numpy
python3 setup.py build
cd ..

