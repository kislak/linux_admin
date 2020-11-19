# firewall

iptables -L -n
iptables-save
ip6tables

firewall-cmd --list-all

netfilter 
  - core module filter trafic
  -t raw (before conntrack/state)
  -t mangle (modify header)
  -t nat (masquarate)
  -t filter
  -t security
    
таблицы
цепочки 
правила
счетчики - пакеты, байты
  iptables -Z # to zero
  -v # verbose


chains
  prerouting
  postrouting
  output (from internal app)
  input (for the sys)
  forward (pass through)

man iptables-extensions

reject - icpm-port-unreachable
deny - no answer

firewall-cmd

nc - netcat (telnet) 
  см открытый урок
  
