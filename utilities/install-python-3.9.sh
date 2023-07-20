#!/bin/bash

# Check if the python3 version  

python3.9 --version

if [ $? -ne 0 ]; then
   cd /tmp
   yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel make -y 
   wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
   tar -xvf Python-3.9.6.tgz
   cd Python-3.9.6 && ./configure --enable-optimizations
   #make
   #sleep 60
   make altinstall
   #sleep 30
   python3.9 --version
   if [ $? -eq 0 ]; then
      echo "Installed python 3.9"
   else
      echo "Failed to install python 3.9"
   fi
else
    echo "Python 3.9 is already installed. Skipping this part"
fi