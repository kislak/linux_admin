## dhcp pxe

https://github.com/nixuser/virtlab/tree/main/centos_pxe

no dhcp
  printer, dhcp server

DORA
  DISCOVERY ->
  OFFER <-
  REQUEST -> 
  ACKNOWLEDGE <-

lease time

ports
  67 - server
  68 - client

isc dhcp
kea https://www.isc.org/kea/
dnsmasq
udhcpd (busybox)

options
  time_server
  dns_server

rpm -ql dhcp-server

cat /usr/share/doc/dhcp-server/dhcpd.conf.example 

server> journalctl -f

pxe (Preboot Execution Environment, booting computers via a network)
  (bios -> network boot)
  DHCP/TFTP PXE server (filename, network addres: grub, iso)
  NBP - network boot programm

tftp
  trivial file trnafer protocol
  lan, udp, port 69
  yum search tftp   

pxelinux
syslinux
isolinux (livecd)

ipxe https://ipxe.org/

cobbler
cobbler.github.io/quickstart
  not for ubuntu

