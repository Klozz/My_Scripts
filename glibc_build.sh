#!/bin/bash
# Build kernel script
# Copyright (C) 2022 Klozz jesus
# Author: Carlos "klozz" Jesus <klozz@TheXPerienceProject.org>
# TeamMEX@XDA-Developers
#

#colors?
CLR_RST=$(tput sgr0)                            ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)                 #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)                 #  green, plain
CLR_YELLOW=$CLR_RST$(tput setaf 3)              #  yellow, plain
CLR_BLU=$CLR_RST$(tput setaf 4)                 #  blue, plain
CLR_MAGENTA=$CLR_RST$(tput setaf 5)             #  magenta, plain
CLR_CYA=$CLR_RST$(tput setaf 6)                 #  cyan, plain
CLR_BLD=$(tput bold)                            ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1)     #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2)     #  green, bold
CLR_BLD_YELLOW=$CLR_RST$CLR_BLD$(tput setaf 3)  #  yellow, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4)     #  blue, bold
CLR_BLD_MAGENTA=$CLR_RST$CLR_BLD$(tput setaf 5) #  blue, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6)     #  cyan, bold

echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
mkdir $HOME/glibc/ && cd $HOME/glibc
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
echo -e "${CLR_BLD_BLU}    Download Glibc from gnu ftp "
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
wget http://ftp.gnu.org/gnu/libc/glibc-2.32.tar.gz
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
echo -e "${CLR_BLD_BLU}    untar glibc  "
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
tar -xvzf glibc-2.32.tar.gz
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
echo -e "${CLR_BLD_BLU}    building process "
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
mkdir build
mkdir glibc-2.32-install
cd build
# ~/glibc/glibc-2.32/configure --prefix=$HOME/glibc/glibc-2.32-install
~/glibc/glibc-2.32/configure --prefix=/usr
make --j$(nproc --all)
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
echo -e "${CLR_BLD_BLU}    installing"
echo -e "${CLR_BLD_CYA}==================================================================${CLR_RST}"
make install
