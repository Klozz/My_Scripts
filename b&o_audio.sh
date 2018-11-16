#!/bin/bash
# Script Author: Klozz jesus
# Set configuration for  HP Pavilion Power Laptop 15-cb0xx
#hda-verb /dev/snd/hwC[[:print:]]*D0 0x20 SET_COEF_INDEX 0x67
#hda-verb /dev/snd/hwC[[:print:]]*D0 0x20 SET_PROC_COEF 0x3000
#Write the proper config for front speakers B&O also redirects stderr 
#test by yourself for me those 2 configs worked fine 

#Front lineout
#echo "0x13 0x01014010" | tee /sys/class/sound/hwC0D0/user_pin_configs 2>>/tmp/klozz-B&O_conf_err.txt

#Internal Speker
echo "0x14 0x90170150" | tee /sys/class/sound/hwC0D0/user_pin_configs 2>>/tmp/klozz-B&O_conf_err.txt
