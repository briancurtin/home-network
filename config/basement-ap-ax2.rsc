# 2026-01-03 01:01:53 by RouterOS 7.20.6
# software id = L7YE-YED4
#
# model = C52iG-5HaxD2HaxD
# serial number = HHM0A4ACYWY
/interface bridge
add admin-mac=F4:1E:57:B2:F7:37 auto-mac=no name=bridge
/interface ethernet
set [ find default-name=ether1 ] comment=Upstream
set [ find default-name=ether2 ] comment=NAS
set [ find default-name=ether3 ] comment="Apple TV"
set [ find default-name=ether4 ] comment=Receiver
/interface wifi
set [ find default-name=wifi1 ] channel.skip-dfs-channels=10min-cac comment=\
    "5 GHz" configuration.country="United States" .mode=ap .ssid="Olive Pit" \
    disabled=no security.authentication-types=wpa2-psk,wpa3-psk .ft=yes \
    .ft-over-ds=yes
set [ find default-name=wifi2 ] channel.skip-dfs-channels=10min-cac comment=\
    "2.4 GHz" configuration.country="United States" .mode=ap .ssid=\
    "Olive Pit" disabled=no security.authentication-types=wpa2-psk,wpa3-psk \
    .ft=yes .ft-over-ds=yes
/interface ethernet switch
set 0 cpu-flow-control=yes
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/user group
add name=homeassistant policy="read,test,api,!local,!telnet,!ssh,!ftp,!reboot,\
    !write,!policy,!winbox,!password,!web,!sniff,!sensitive,!romon,!rest-api"
/disk settings
set auto-media-interface=bridge auto-media-sharing=yes auto-smb-sharing=yes
/interface bridge port
add bridge=bridge comment=NAS interface=ether2
add bridge=bridge comment="Apple TV" interface=ether3
add bridge=bridge comment=Receiver interface=ether4
add bridge=bridge comment=OPEN interface=ether5
add bridge=bridge interface=wifi1
add bridge=bridge interface=wifi2
add bridge=bridge comment="Upstream from ax3" interface=ether1
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add interface=bridge list=LAN
/ip dhcp-client
add interface=bridge
/ip dns
set allow-remote-requests=yes
/system clock
set time-zone-name=America/Denver
/system identity
set name=basement-ap-ax2
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
