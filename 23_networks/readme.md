## networks
инкапсуляция данных
  заварачиваем чистые данные

mac - media access control
lcc - logical link control

oui (3 octets)
  organization UI
nic (3 octets)

0 unicast
1 multicast

ip
  arp igmp icmp

arp
  address resolution protocol

  > arp -a
  > ip neigh
  через какой нитерфейс доступен ip?

  > tcpdump

  
  tcpdump -i eth0 arp
  ip neigh flush

don't fragment
  ping -h
    -M
  mtu icmp

  ip l|grep mpu
    mtu 1500 - ether2 (max transfre unit)
    mtu 2272 - wlan

  mtu discovery
    icmp error: packet too big, use 1400
    firewall (icmp disable - haha)

  ping ya.ru -s 9000 -M do


link naming
  eth0, eth1, iftypeN
  systemd Predictable network interface Names
    (en|wl)p0s3 (pci 0 slot 3)


ipcalc -c

ipcalc -4 -b -m 192.168.0.1/24
  network address
  host address


> tshark -Y http
  tshark -XX
  tshark -VV

message type
  unicast
  multicast
    iptv
  broadcast
    ping 192.168.0.255 -b

-----------
mtu
ttl
df don't fragment flag
icmp

centos: ip vs nmcli vs /etc/sysconfig/network-scripts
----------

localhost mtu 65536
cat /etc/networks

tshark tcp 


3 phase handshake: 
  SYN - SYN+ACK - ACK
  setup session
  sysctl -a |grep somax
    128
  syn_max_backlog
    128
    sys_flood attack
      syn - no ack
    net.ipv4.tcp_syncookies = 1tlpn

 recive queue (accept)
   netstat -tlpn
   ss

tcp window
  more segments before ACK
  in bytes



ss - socket state
  -tulpn
  t tcp
  u udp
  l listen
  p 
  process, pid, fd - file descriptor

TIME-WAIT 
  2 MSL 60 sec
  socket is busy
  sysctl -a |grep tcp_tw_reuse #(tcp timewait)

  tcp_mem, tcp_rmem. tcp_wmem
  

routes:
  ip route list 
  ip rule

vagrant - private network
  tracepath
  traceroute
  mtr
  iperf
    iperf -s && iperf -c server

 
