## dynamic web

https://k6.io/



разбираться в CGI/FCGI/WSGI/mod_xxx;
настраивать uwsgi/php_fpm;
понимать Ajax/Long Pooling/Websockets.

Результаты
настраивать uwsgi/php_fpm.

unix socket 
  file
  lsof -p #(pidof mysql)|grep .sock  
  ls /proc/xxx/fd #-> 48.socket
    
sysctl -a | grep somaxconn (wait for accept)

мультиплексор ядра (несколько алгоритмов в ядре)
  22 порт - несколько коннекшенов
  (несколько процессов слушают один и тот же порт)
    знаем с какого порта пришли
  10тыс
  
  select() - по циклу - кому пакет?
    accept - fork - read/write - close - exit
    apache 

  epoll (event pull)
    interest list
    ready list
    nginx
      master process (watch workers)
      worker (8) - all workers listen to socket
      worker - per core
    sysctl -e |grep max_user_watches
    max_user_watches 400 тыс

сайт тормозит  
  client (browser: html css js)
    timing
      ttfb - time to first byte
    file size
  web server (upstream)
    cache (files)
      free -h (buff/cache)
    gzip (io - cpu)
      1mb -> 300kb
  dynamic web engine
    > ulimit -a
    > htop
    // use unix socket if on the same PC           
  db connect
    connection pool (many connections)
    external pool
      proxysql, 
      maxscale, 
      pgbounder,
      odissey
  db

-------------------

cgi
  apache - mod_cgi
  params -> stdin (env vars), stdout, stderr
  cgi-gateway
  cgi-script (bash script)
    write bash echo "<html>"

fastCGI
  one daemon (independent from http server)
  
mod_php ()

cat 1.conf| egrep '^;|^$'

nginx 2 connections
