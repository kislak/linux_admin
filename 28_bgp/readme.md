## bgp

https://learning.oreilly.com/videos/border-gateway-protocol/9780133757330/
https://learning.oreilly.com/videos/bgp-troubleshooting-livelessons/9780134582863
https://tools.ietf.org/html/rfc4271

Border Gateway Protocol
протокол пограничного шлюза
  дистанционно-векторный
  децентрализованный
  фильтрация, приоритеты маршрутов
  защита от петель
  внутри АС (iBGP)
  между АС (eBGP)
  уровень L7 - Application layer Protocol
  пиринг через TCP-сессию
  TCP port 179
  800k routes

автономная сисстема 
  система ip сетей управлямые одним оператором 
  и имеющую общую политику маршрутизации с интернетом

номер автономной системы
  16 диапазон 
  rfc 4893 - 2007
    32 бит диапазон
    64512 - 65534 - приватные номера

pa - provider aggregatable
pi - provider independent

ripe.net - интернет регистратор

keepalive time 90s
hold time 30s

frr
  Free Range Routing 
  https://frrouting.org/

bird

bird.network.cz

bgp
  routing information base
  announcement
  full view - полная таблица маршрутов BGP в сети Интернет // дайте две!
  default route
  маршруты /32 - заблокировано органами
  
advertised-routes
received-routes


attributes mandatory
  NEXT_HOP (destination network eBGP)
  AS-PATH (список AS)
  ORIGIN (where from: IGP, EGP, Incomplete)

административная дистанция - мера достоверности маршрута
  (протокол маршрутизации)
  igp - внутри АС


lg.selectel.ru
lg.retn
