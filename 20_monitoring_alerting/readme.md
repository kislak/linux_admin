## monitoring

whitebox
  знание о том как устроена инфраструктура
  agent
blackbox


metrics
  loadAvg, cpu, net, disk
  mem-disk  
  
  наличие процесса
  открытые сокеты/порты
  статус


исторические данные
  как собирать 
  как хранить
  timeSeries датабейз
  

zabbix
  agent
  snmp
  jmx
  ipmi

tigger (по достижению определенного состояния)
  имя
  важность триггера
  синтаксис
    {host:key.function(param)}=0
    {vm.memory.size[availalbe].last(0)}<20M
  тестирование

notifications
  mail
  sms
  sip (робобаба)
  jabber
  slack
  telegram
  discord

housekeeper

prometheus  
https://prometheus.io/docs/instrumenting/exporters/
  thanos
  victoria metrics
  click house

netdata - просто быстро

statping - минимальный функционал

https://github.com/prymitive/karma
alerta

grafana
  datasource - prometheus
  dashboard - (can take from community)

https://github.com/samber/awesome-prometheus-alerts


