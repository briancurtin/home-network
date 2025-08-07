# 1970-01-02 00:14:01 by RouterOS 7.15.2
# software id = STDB-BJED
#
# model = C52iG-5HaxD2HaxD
# serial number = HH30A7RNQ3Q
/interface bridge
add name=bridge1
/interface wifi
set [ find default-name=wifi1 ] configuration.country="United States" .mode=\
    station .ssid="Olive Pit" disabled=no
set [ find default-name=wifi2 ] configuration.country="United States" .mode=\
    station .ssid="Olive Pit" disabled=no
/interface list
add name=WAN
add name=LAN
/interface bridge port
add bridge=bridge1 interface=ether1
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=ether5
add bridge=bridge1 interface=wifi1
/interface list member
add interface=bridge1 list=LAN
/ip address
add address=192.168.90.1/24 interface=ether2 network=192.168.90.0
/system identity
set name=Garage
/system note
set show-at-login=no
