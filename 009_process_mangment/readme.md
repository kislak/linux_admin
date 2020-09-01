Алексей Цыконов

## Управление процессами
объяснить, что такое процесс, его атрибуты, жизненный цикл процесса;
объяснить, чем потоки отличаются от процессов;
мониторить процессы, в каком они состоянии, понимать чем они сейчас заняты;
изучить команды ps/top, подсистему /proc, а также команды gdb/strace/ltrace;
менять приоритеты с мощью команд nice, ionice;
посылать различные сигналы процессам.

## Цели занятия
объяснить, что такое процесс, его атрибуты, жизненный цикл процесса;
объяснить, чем потоки отличаются от процессов;
мониторить процессы, в каком они состоянии, понимать чем они сейчас заняты;
изучить команды ps/top, подсистему /proc, а также команды gdb/strace/ltrace;
менять приоритеты с мощью команд nice, ionice;
посылать различные сигналы процессам.

## Краткое содержание
процесс и его атрибуты;
жизнь процессов;
процессы и потоки;
получение информации о процессе;
управление процессом.

## Результаты
применять вышеуказанные команды в своей работе и получать больше информации и следовательно больше контролировать процессы, работающие в системе.


## Конспект

fork
  exec
  setuid

процессы и его атрибуты
жизненный цикл
получение информации о процессе

UID 
  (username /etc/passwd)
  Real UserID
  Effective user id (SUID, SGID) - повышать приоритет
  Saved UserID - понижать приоритет

PID
  1 - user/lib/systemd/systemd
PPID
  parent pid
TIME
  время "сожранного" цпу
PRI
NICE
  19 - всех пропускает
  -20 - сам
  nice, renice, 

ionice
  idel
  best efforts
  realtime
  dd oflag=direct


```
ps aux
  ps -ejhf   
ps -eL
  lwp - lightweighed processes (threads)
```

pstree
pgrep -p <PID>
pgrep mysql

ps -e --forest
ps -fp <PID>

ps -Lfp $(pgrep mysql)


rss - residence segment size
  (собстенная + общая память)

ps axo rss

ps rx - running process
state
  R - running
  S - sleeping
  D - uninterruptable io
    vmstat 1
    wa - waiting ожидание ввода/вывода
      синхронная работа с вводом/выводом
        цпу не пререключает конеткс
  Z - zombie
    no memory consumption
    but use descriptor
    kill no zombie - kill parent
    ulimit -a 
  t - trace
  T - STOP
  -----
  s (session leader)
  < - high priority 
  N - low priority
  l - multy-thread
  + - running in foreground
  
5х ядра - асинхронный режим работы с дисками (сети иже давно)

kill -l
kill -19 <PID> - stop

gdb -p <PID> #dbuger

---------------
fork - 
  1 память для нового процесса
  2 назначается пид
  3 создается копия процесса (памяти, ссылка на дескрипторы фалов/ио)
  4 увелічівает счеткікі файлов
  5 

threads
  man 7 pthreads  


https://apidock.com/ruby/Signal
```ruby 
Signal.trap("TERM") do
  puts "Terminating..."
  shutdown()
end
```

elf
```
/usr/lib64/ld-2.17.so /bin/chmod +x /bin/chmod

```

lsof -p <pid>
-> /usr/

  lsof -u mysal
    -> files
    -> sockets (tcp)

  sudo lsof -i 4 (ipv4)
  lsof -t <file>
       +D <directory>
  fuser - the similar utility

kill -l
kill -2 
sigcld 17 - wait()

1 - hup hangup - review config
2 - int - interrupt received
9 - kill
11 - segv - segmentaion violation
13 - pipe - broken pipe
15 - term - termination signal
19 - stop

-----------------
изоляция
  namespace 
    mount
  
nsenter -m -t <pid> 
  --mount (switch to to namespace)
  -> ip -a (see some interface)
  - можно подлкючиться к докеру из ранать утилиты хоста!!!

unshare

pstree
fuser

----------------------
ls /proc
ls -l /proc/<pid>
ls -l /proc/<pid>/fd 
  /fd - file descriptors
  /cwd - current workdir
  /environ - (docker - passwords)
  /exe - executable
  /status - information about process
  /ns - namespaces
  /limits (max, min)
  /net (network tree)
  /stack - current stack
  # to update sysctl

cat /proc/cpuinfo
cat /proc/meminfo

ls /proc/*/ns/*
sysctl -a
sysctl --system #apply

фоновые процесы
jobs
&
ctrl-z


screen 
  ctrl-a-d
  screen -x
  screen -ls

tmux

strace
  -c count statisitc
  -t timestamp
  -T 
  -o <file>
  -p <pid>
  
ltrace
  -||-
 
gdb
  prlimit
  
  kill zombi
    gdb -p <PID>
    attach <PID>
    call waitpid(zom, 0,0)
    wait
    detach
    quit
    (call any signal)

ln - hardlink to inode

stat /pro
debugfs - restore hardlink to inode
  link
  dup
  fcntl
  dup2 - restore file


очистить файл
```

> /proc/<PID>/fd/3 

```

fork_bomb.sh
:(){ :|:& };:
