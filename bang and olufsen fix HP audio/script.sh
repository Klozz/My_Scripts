#!/bin/sh
# Permanent Bang and olufsen audio fix for ubuntu
# to remove this changes remove those files listed here and reboot
# Author: Carlos 'Klozz' Jesus
# 

cp hda-BangAndOlufsen-retask.fw /lib/firmware/hda-BangAndOlufsen-retask.fw 2>>/tmp/klozz_BangOluf_errors/errors.log
cp hda-BangAndOlufsen-retask.conf /etc/modprobe.d/hda-BangAndOlufsen-retask.conf 2>>/tmp/klozz_BangOluf_errors/errors.log

