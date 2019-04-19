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
    #2.4GHz setup wifi 80211 b,g,n
    interface=wlan0
    driver=nl80211
    ssid=JASPIS i1 Hotspot
    hw_mode=g
    channel=8
    wmm_enabled=0
    macaddr_acl=0
    auth_algs=1
    ignore_broadcast_ssid=0
    wpa=2
    wpa_passphrase=12345
    wpa_key_mgmt=WPA-PSK
    wpa_pairwise=CCMP TKIP
    rsn_pairwise=CCMP
    
    #80211n - Change GB to your WiFi country code
    country_code=US
    ieee80211n=1
    ieee80211d=1
EOF

cat <<EOF > /etc/default/hostapd
    # Defaults for hostapd initscript
    
    # See /usr/share/doc/hostapd/README.Debian for information about alternative
    # methods of managing hostapd.
    
    # Uncomment and set DAEMON_CONF to the absolute path of a hostapd configuration
    # file and hostapd will be started during system boot. An example configuration
    # file can be found at /usr/share/doc/hostapd/examples/hostapd.conf.gz
    
    DAEMON_CONF="/etc/hostapd/hostapd.conf"
    
    # Additional daemon options to be appended to hostapd command:-
    #       -d   show more debug messages (-dd for even more)
    #       -K   include key data in debug messages
    #       -t   include timestamps in some debug messages
    
    # Note that -B (daemon mode) and -P (pidfile) options are automatically
    # configured by the init.d script and must not be added to DAEMON_OPTS.
    
    # DAEMON_OPTS=""
EOF

cat <<EOF > /etc/dnsmasq.conf
    #AutoHotspotN config
    interface=wlan0
    bind-dynamic
    server=8.8.8.8
    domain-needed
    bogus-priv
    dhcp-range=192.168.50.150,192.168.50.200,72h
EOF

# Stage 2
sudo cp /etc/network/interfaces /etc/network/interfaces-backup

cat <<EOF > /etc/sysctl.conf

EOF

cat <<EOF > /etc/dhcpcd.conf
    # A sample configuration for dhcpcd.
    # See dhcpcd.conf(5) for details.
    
    # Allow users of this group to interact with dhcpcd via the control socket.
    #controlgroup wheel
    
    # Inform the DHCP server of our hostname for DDNS.
    hostname
    
    # Use the hardware address of the interface for the Client ID.
    clientid
    # Or use the same DUID + IAID as set in DHCPv6 for DHCPv4 ClientID as per RFC4361.
    # Some non-RFC compliant DHCP servers do not reply with this set.
    # In this case, comment out duid and enable clientid above.
    #duid
    
    # Persist interface configuration when dhcpcd exits.
    persistent
    
    # Rapid commit support.
    # Safe to enable by default because it requires the equivalent option set
    # on the server to actually work.
    option rapid_commit
    
    # A list of options to request from the DHCP server.
    option domain_name_servers, domain_name, domain_search, host_name
    option classless_static_routes
    # Most distributions have NTP support.
    option ntp_servers
    # Respect the network MTU. This is applied to DHCP routes.
    option interface_mtu
    
    # A ServerID is required by RFC2131.
    require dhcp_server_identifier
    
    # Generate Stable Private IPv6 Addresses instead of hardware based ones
    slaac private
    
    # Example static IP configuration:
    #interface eth0
    #static ip_address=192.168.0.10/24
    #static ip6_address=fd51:42f8:caae:d92e::ff/64
    #static routers=192.168.0.1
    #static domain_name_servers=192.168.0.1 8.8.8.8 fd51:42f8:caae:d92e::1
    
    # It is possible to fall back to a static IP if DHCP fails:
    # define static profile
    #profile static_eth0
    #static ip_address=192.168.1.23/24
    #static routers=192.168.1.1
    #static domain_name_servers=192.168.1.1
    
    # fallback to static profile on eth0
    #interface eth0
    #fallback static_eth0

    interface wlan0
    static ip_address=192.168.4.1/24

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
