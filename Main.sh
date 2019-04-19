sudo apt-get purge dns-root-data

# stage1
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install hostapd
sudo apt-get install dnsmasq

sudo systemctl disable hostapd
sudo systemctl disable dnsmasq

/usr/bin/autohotspotN

cat <<EOF > /etc/hostapd/hostapd.conf

EOF

cat <<EOF > /etc/default/hostapd

EOF

/etc/dnsmasq.conf

step 2

sudo cp /etc/network/interfaces /etc/network/interfaces-backup

/etc/sysctl.conf

/etc/dhcpcd.conf
 nohook wpa_supplicant
 
 /etc/systemd/system/autohotspot.service
 
 sudo systemctl enable autohotspot.service

sudo apt-get install iw



sudo chmod +x /usr/bin/autohotspotN
