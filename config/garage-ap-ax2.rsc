# 2026-01-02 14:26:51 by RouterOS 7.19.4
# software id = STDB-BJED
#
# model = C52iG-5HaxD2HaxD
# serial number = HH30A7RNQ3Q
/interface bridge
add name=bridge
/interface wifi
set [ find default-name=wifi1 ] configuration.country="United States" .mode=\
    station-bridge .ssid="Olive Pit" disabled=no
set [ find default-name=wifi2 ] configuration.country="United States" .mode=\
    station-bridge .ssid="Olive Pit"
/interface list
add name=WAN
add name=LAN
/user group
add name=homeassistant policy="read,test,api,!local,!telnet,!ssh,!ftp,!reboot,\
    !write,!policy,!winbox,!password,!web,!sniff,!sensitive,!romon,!rest-api"
/interface bridge port
add bridge=bridge interface=ether1
add bridge=bridge interface=ether2
add bridge=bridge interface=ether3
add bridge=bridge interface=ether4
add bridge=bridge interface=ether5
add bridge=bridge interface=wifi1
/interface list member
add interface=wifi1 list=WAN
add interface=bridge list=LAN
/ip address
add address=192.168.90.1/24 disabled=yes interface=bridge network=\
    192.168.90.0
/ip dhcp-client
add disabled=yes interface=bridge
/ip dns
set servers=192.168.0.1
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add disabled=yes distance=1 dst-address=0.0.0.0/0 gateway=bridge \
    routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/system identity
set name=garage-ap-ax2
/system ntp client servers
add address=192.168.0.1
