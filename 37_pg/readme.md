## pg

архитектура
базговые настройки


локалхос
  postgres - дефолт юзер - админ
  без пароля

\?
\l
\c database
\d+

view - сохраненный селект

sq - сквонзые айдишки на 3 таблицы
   в ридонли не работает select nextval(my_sq);


ingres - interactive graphic retrieval system
postgres - postingres 1996

extention
  pl_perl
  pl_ruby
  
pivot

json support
  postgrespro.ru

кластер - инстанс с несколькими базами

инстанс базы данных
  набор бэкграунд процессов
  набор файлов

pgAdmin

ls -l /var/lib/postgresql/data/base
  oid - databases files

------------------
ps ax |grep postgres
  - master process (postgres)
  - process for each connection (postgres)
    https://www.pgbouncer.org - keep connection pool
  - pgbouncer
  shared memory
  wal writer - (write ahead log) - 1 sec
  log writer
  archiver
  stat collector
  autovacuum
  checkpointer
  

индекс может быть в 2-3 раза больше таблицы

кластерезированный индекс - (данные рядом с индексом - не ссылка)
  быстрый 
  большой
  тяжелый
  
barrel
