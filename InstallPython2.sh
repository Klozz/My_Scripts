#!/bin/bash
#
# script to download and build python2 on ubuntu 23.04
# Copyright (C) 2023
# Author: Carlos "klozz" Jesus

wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
sudo tar xzf Python-2.7.9.tgz
cd Python-2.7.9
echo " Configuration with optimizations "
sudo ./configure --enable-optimizations
echo " building and installing"
sudo make altinstall
echo " Generating symlink"
sudo ln -sfn '/usr/local/bin/python2.7' '/usr/bin/python2'