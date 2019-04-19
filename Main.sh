sudo apt-get purge dns-root-data

# stage1
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install hostapd
sudo apt-get install dnsmasq

sudo systemctl disable hostapd
sudo systemctl disable dnsmasq

# Copy autohotspotN to /usr/bin/autohotspotN
sudo cp /etc/autohotspotN* /usr/bin/autohotspotN

cat <<EOF > /etc/hostapd/hostapd.conf

EOF

cat <<EOF > /etc/default/hostapd

EOF

/etc/dnsmasq.conf

# Stage 2
sudo cp /etc/network/interfaces /etc/network/interfaces-backup

cat <<EOF > /etc/sysctl.conf

EOF

cat <<EOF > /etc/dhcpcd.conf
    nohook wpa_supplicant
EOF
 
cat <<EOF > /etc/systemd/system/autohotspot.service
    [Unit]
    Description=Automatically generates an internet Hotspot when a valid ssid is not in range
    After=multi-user.target
    [Service]
    Type=oneshot
    RemainAfterExit=yes
    ExecStart=/usr/bin/autohotspotN
    [Install]
    WantedBy=multi-user.target
EOF

# start autohotspot
sudo systemctl enable autohotspot.service

sudo apt-get install iw

sudo chmod +x /usr/bin/autohotspotN

cat <<EOF > /etc/wpa_supplicant/wpa_supplicant.conf
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    country=GB

    network={
	    ssid="mySSID1off"
        psk="myPassword"
        key_mgmt=WPA-PSK
    }
EOF
