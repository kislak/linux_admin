## routing, ospf

numbering & renumbering

rfc 1918
https://tools.ietf.org/html/rfc1918

local
10. /8 
172.16 /12
192.168. /16


rfc 6890

spec
0. /8 - host is soruce
127. /8 loopback
100.64. /16-  nat
169.254. /16 link local (no dhcp)
240. /4 multicast
  snooping (switch support multicast)
  ospf 240.0.0.5
-------------------------

белый айпи
  в рамках автономной системы
  as ripe ncc


ip route add blackhole 10/8

loopback
  типа виртуальный инфтерфейс, всегда поднят

link state
  ospf - open shortest path first
    dejkstra
  топлология на кажной ноде
distance vector
  rip
bgp

https://www.quagga.net/
  cisco like syntax
  frrouting.org
    ansible https://docs.ansible.com/ansible/latest/network/user_guide/platform_frr.html

bird 
  bird.network.cz

XORP
  https://en.wikipedia.org/wiki/XORP

