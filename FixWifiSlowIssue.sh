#!/bin/sh
# Fix Wifi slow issue on ubuntu 18.04-18.10

echo "options iwlwifi 11n_disable=1" | sudo tee /etc/modprobe.d/iwlwifi.conf

