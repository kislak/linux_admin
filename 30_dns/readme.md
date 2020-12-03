## dns

bind9
  /usr/sbin/named
  /etc/named.conf
powerdns 
  mysql db

dnslookup
dig

53 port udp

обслуживать зоны днс
  принимать запросы и резолвить в айпи

yum provides nslookup
yum install bind-utils
nslookup otus.ru
dig otus.ru
dig otus.ru +short


cat /etc/resolv.conf
man reslov.conf

domain home
search [search domains]
nameserver 8.8.8.8 (provider blocks 53)

ss -tlpn

reverse dns 
  ip into name - usually disable
  but email server

FQDN 
  fully qualified domain name
  www.otus.ru.

https://www.isc.org/bind/

servers:
  primary - master - main info about zone
  secondary - slave - copy from primary
  cache
  recursor - full search in hierarchy 
  
DNS = database
  record (rule) 
    name
    ttl
    class (IN)
    tip (A, MX)
      A  - v4
      AAAA - v6
      CNAME - alias
      MX - mail
      TXT - text info
      SOA - key record - start of authority
      NS - primary ref
      PTR - reverse (find name)
    priority
    value

ttl (for zone)
  3600

security
  limit update sources


allow update 
  nsupdate -k /the.key
  dinamic updates


https://www.terraform.io/docs/providers/powerdns/index.html
https://kb.isc.org/docs/aa-00723
https://bind9.readthedocs.io/en/latest/

split-dns
  view
  app.domain.com
    192.168.0.12
    8.9.1.1
  
view client1 {
  
}   

dnssecurity extentions

time dig habr.com

record + keys


drop cache
