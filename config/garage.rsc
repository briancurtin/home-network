# 2025-08-08 08:14:26 by RouterOS 7.19.4
# software id = STDB-BJED
#
# model = C52iG-5HaxD2HaxD
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
/interface bridge port
add bridge=bridge interface=ether1
add bridge=bridge interface=ether2
add bridge=bridge interface=ether3
add bridge=bridge interface=ether4
add bridge=bridge interface=ether5
add bridge=bridge interface=wifi1
/interface list member
add interface=bridge list=LAN
add interface=wifi1 list=WAN
/ip address
add address=192.168.90.1/24 interface=bridge network=192.168.90.0
/ip dhcp-client
add interface=bridge
/ip dns
set servers=192.168.0.1
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=bridge \
    routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/system clock
set time-zone-name=America/Denver
/system identity
set name=Garage
/system ntp client servers
add address=192.168.0.1
