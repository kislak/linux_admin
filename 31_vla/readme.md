## vlan

virtual local area network
зачем?
  создание логической топологии вне зависимости от физической топологии
  изоляция сегментов
  сокращение широковечательного трафика (broadcast)

ieee 802.1q  
  тэгирование на l2 (ethernet frame)
  vlan ID VID 12 bit
  
vlan'ы позволяют нарезать L2 пространство на сегменты, соответствующие L3 сегментации.

а в неуправляемых свичах влана нет? 
там только тот vlan, который приходит и будет нативным 

native VLAN

lacp
  link aggregation control protocol
  
  port trunking
  link binding
  nic bonding
  nic teaming
  etherChannel
  PAgP

fail tolerance 
balancing

bonding
  round robin
  active backup
  xor (no switch support required)
  broadcast
  dynamic link aggregation
  tlb - transmit load balancing
  alb - adaptive load balancing

> nmcli

virtual
cat /etc/sysconfig/network-scripts/ifcfg-bond0
cat /etc/sysconfig/network-scripts/ifcfg-eth1
cat /etc/sysconfig/network-scripts/ifcfg-eth2
cat /proc/net/bonding/bond0


ip link
ip link set eth1 down
ip link set eth1 up

tcpdump -nvvv -ieth1
  -As0 -x -e

лучше четное кол-во каналов

teaming
  агрегация на уровне ядра
  port stickinnes
  
modinfo team # kernel module 

keep mac-address 

