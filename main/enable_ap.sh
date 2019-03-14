#!/bin/bash

sleep 3

# enable the AP
sudo cp config/hostapd /etc/default/hostapd

if [ -e /etc/default/hostapd ]
then
    echo "" > /etc/default/hostapd
    echo "" > /etc/dhcpcd.conf
    echo "" > /etc/dnsmasq.conf
    
    cat << EOF > /etc/default/hostapd
      # Defaults for hostapd initscript
      #
      # See /usr/share/doc/hostapd/README.Debian for information about alternative
      # methods of managing hostapd.
      #
      # Uncomment and set DAEMON_CONF to the absolute path of a hostapd configuration
      # file and hostapd will be started during system boot. An example configuration
      # file can be found at /usr/share/doc/hostapd/examples/hostapd.conf.gz
      #
      #DAEMON_CONF=""
      #
      # Additional daemon options to be appended to hostapd command:-
      #       -d   show more debug messages (-dd for even more)
      #       -K   include key data in debug messages
      #       -t   include timestamps in some debug messages
      #
      # Note that -B (daemon mode) and -P (pidfile) options are automatically
      # configured by the init.d script and must not be added to DAEMON_OPTS.
      #
      #DAEMON_OPTS=""
      DAEMON_CONF="/etc/hostapd/hostapd.conf"
    EOF
    
    cat <<EOF > /etc/dhcpcd.conf
      
    EOF
    
    cat <<EOF > /etc/dnsmasq.conf
      
    EOF
    
    cat <<EOF > /etc/wpa_supplicant/wpa_supplicant.conf
      
    EOF
else
    
fi

echo "" > 




sudo cp main/config/dhcpcd.conf /etc/dhcpcd.conf
sudo cp main/config/dnsmasq.conf /etc/dnsmasq.conf

# load wan configuration
sudo cp main/wpa.conf /etc/wpa_supplicant/wpa_supplicant.conf

sudo reboot now
