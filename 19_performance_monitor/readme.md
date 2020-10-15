## Performance monitoring

load average - число процессов в очереди на исполнение

cat /proc/loadavg
uptime
top

la должен быть не больше количества ядер
  борьба за ресурсы
    cpu
    disk (io)
    network 

top
  cpu user, system, nice, idel, 
  wa (io wait) st (still time, драка за цпу в виртулке)
  hz - квант времени

IO
  vmstat
  iotop (kernel accounting)
  iostat
  
/dev/urandom - быстро 
/dev/random  - счетчик пакетов

cat /proc/diskstats #13
/proc/<pid>/fd
lsof                  

connect timeout - 3sec
write timeout - 3 sec
read timeout - (wait mysql - 3sec+)

vm.swappiness 0


kernel accounting 
  atop
  sar

monit

strace filename
strace -p <pid>
strace -c -p <pid> - statistics
strace -ff -p <pid> - fork


sysrq
echo 1 > /proc/sys/kernel/sysrq
echo b > /proc/sysrq-trigger


