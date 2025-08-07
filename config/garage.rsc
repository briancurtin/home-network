# 1970-01-02 22:51:40 by RouterOS 7.15.2
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
/interface list member
add interface=bridge list=LAN
add interface=wifi1 list=WAN
/ip address
add address=192.168.90.1/24 interface=bridge network=192.168.90.0
/system identity
set name=Garage
/system note
set show-at-login=no
