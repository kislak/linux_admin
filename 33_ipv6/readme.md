## ipv6

some other lectures 
  https://intuit.ru/studies/professional_skill_improvements/11158/courses/1119/lecture/17419


недостатки и особенности
  dhcp
  icmp (ping)
  arp (ip into mac)
  stack ipsec
  фрагментация на маршрутизации (icmp - согласование mtu)

number of addresses:  
  340,282,366,920,938,463,463,374,607,431,768,211,456
  единое адресное пространство, бесклассовая адресация
  
  arp in protocol
  multicast in protocol
  no broadcast
  ipsec in protocol
  no NAT
  
несколько адрессов на интерфейсе

eth1 - этаж 1 
global unicast address (в глобальной сети)
link-local address (в канале)

> ip -6 address show dev eth1
> ip -6 a add fe80::1/64

8 групп
  в каждой старшие нули можно убрать
  самую длинную последовательность нулевых групп можно заменить на ::

2001:0db8:0015:1fff:0000:0000:0000:02af
2001:db8:15:1fff::2af


2001:0db8:0015:1fff:0000:0000:0000:02af/64
  2001:0db8:0015:1fff - network id
  interface id        - 0000:0000:0000:02af

::/0 eq 0.0.0.0

dhcp provide prefix to host to assign address /64
point-to-point /127


2000::/3 - global unicast (current internet)
  /48
  /64
  5 регистраторов
    repe ncc - europe 
  

fe80::/10 - link local unicast
  уникальный на канале
  немаршрутизируемый
  обязательно на кажном интерфейсе всегда
  могут совпадать на разных интерфейсах
ff00::/8 - multicast
  ff02::1%eth1 - все устройства
    > ping6 ff02::1%eth1 # respond 2 nodes
  ff02::2%eth1 - все роутеры
    > ping6 ff02::1%eth1 # respond 2 nodes
  
  ff02::2 - все маршрутизаторыы
::1/128 - loopback
fc00::/7 - localy uniq address

ping6 -I eth1 fe80
ping6 fe80%eth1  # eth1 - idenitifcator kanala (channel id)


interface id
  manual
  EUI-64 (mac)
    mac 48bit
      24bit + 24bit (manufacture_id + device_id)
    not secure - mac address
  privacy extensions (rfc4941)
  icmpv6
    options
      neighbor discovery, router ddiscovery
      stateful
    жизненный цикл (адресс временный)
      tentative
      preferred
      deprecated (no new connections)
      invalid

tcpdump -i eht1 -vv -n icmp6
  86400/3600 = 24
  14400/3600 = 4

ndptool monitor -i eht1

dns
  AAAA (name to ip)
  PTR  (ip to name)
