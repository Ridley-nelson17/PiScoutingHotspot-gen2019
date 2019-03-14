#!/bin/bash

sleep 3

# disable the AP
sudo cp main/config/hostapd.disabled /etc/default/hostapd
sudo cp main/config/dhcpcd.conf.disabled /etc/dhcpcd.conf
sudo cp main/config/dnsmasq.conf.disabled /etc/dnsmasq.conf

# load wlan configuration
sudo cp main/wpa.conf /etc/wpa_supplicant/wpa_supplicant.conf

sudo reboot now
