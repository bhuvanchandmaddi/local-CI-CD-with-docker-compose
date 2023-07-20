#!/bin/bash

ansible --version

if [ $? -ne 0 ]; then
   cd ~ cd 
   python3.9 -m venv venv
   source venv/bin/activate
   # upgrade pip
   python -m pip install --upgrade pip
   python -m pip install ansible
   ansible --version
   if [ $? -eq 0 ]; then
      echo "Ansible installation was successful"
   else
      echo "Ansible installation failed"
   fi
else
   echo "Ansible already installed"
fi