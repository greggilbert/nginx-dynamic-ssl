#!/bin/bash
apt-get install -y python-setuptools python-pip
pip install ansible
ansible-playbook -i "localhost," -c local release.yml