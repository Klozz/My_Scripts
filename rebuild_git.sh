#!/usr/bin/env bash
# If you get gnuTLS handshake in github you can fix it 
# building git using openss instead of gnutls
# I make this script to make it more easy for all :)
# Author: Klozz jesus
###########

# Clear out all previous attempts
rm -rf "~/tmp/gitfix/"

# Get the dependencies for git, then get openssl
sudo apt-get install build-essential fakeroot dpkg-dev -y
sudo apt-get build-dep git -y
sudo apt-get install libcurl4-openssl-dev -y

#Copy git source under tmp/git*
mkdir -p "~/tmp/gitfix/"
cd "~/tmp/gitfix/"
apt-get source git

#decompile if for some reason is not decompiled
dpkg-source -x git-*ubuntu*

# We need to actually go into the git source directory
cd $(find -mindepth 1 -maxdepth 1 -type d -name "git-*")
pwd

# This is where we actually change the library from one type to the other.
# we need to open debian control and edit it so for that we use sed
sed -i -- 's/libcurl4-gnutls-dev/libcurl4-openssl-dev/' ./debian/control
# Remove test to get less build time :)
sed -i -- '/TEST\s*=\s*test/d' ./debian/rules

# Build it.
dpkg-buildpackage -rfakeroot -b
#dpkg-buildpackage -rfakeroot -b -uc -us

# Install the package name is based on the system architecture. 
# So have a look at the package name located in
find .. -type f -name "git_*ubuntu*.deb" -exec sudo dpkg -i \{\} \;
