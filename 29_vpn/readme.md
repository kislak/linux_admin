## мосты, тунели, vpn

setup bridge interface
setup openVPN server
  encription
  WireGuard (vpn/speed)
  

bridge 
  виртуальный коммутатор
  connect networks at l2 level
  коммутатор
  > iproute2 (ip link) 
  > brctl (bridge-utils)  
  interfaces: etc, tap, wi-fi
  up to 1024 

!избегать петель 
  протокол STP


vpn - virtual private networks
  overlay network



тунели 
  логическее соединение между двумя конечными точками посредством инкапсуляции разл протоковлов  
  l4, l7

  инкапсулирует - терминирует
  ip-ip
    unicast IPv4
    external IP address
    no NAT supported
    no OSPF (manual routing)
    no encript
    + no CPU overload (simplicity)

  gre
    generic routing encapsulation
    + multicast IPv4
    
IPsec
  l3, ACL, Сrypto map
  iproute2
  strongSwan
  softether
  Diffie–Hellman protocol
  security association (SA)
  (IP header can be hidden)
  mtu size limit (drop/fragment)
    mss maximum segment size

openVPN
  client-to-server, server-to-server
  openSSL
  ? in china udp is more stable then tcp

server.conf
  tun-mtu 1500
  mssfix 1300


iperf3 -s #trafic generator
iperf3 -c 172.16.1.2 -t 60 -i 5 -b 50M -u 

wireGuard
  cernel 5.6

ip ro
ip rule show
