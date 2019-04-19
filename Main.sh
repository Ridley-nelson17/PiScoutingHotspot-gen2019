sudo apt-get purge dns-root-data

# stage1
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install hostapd
sudo apt-get install dnsmasq

sudo systemctl disable hostapd
sudo systemctl disable dnsmasq
