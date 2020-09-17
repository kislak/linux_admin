
## namespaces cgroups

## Цели занятия

зачем контейнеризация?
  инкапсуляция зависимостей

дать только те ресурсы которые нужны 

-- 
разделение ресурсов сервера
дать только те ресурсы которые нужны 
песочница для критических сервисов
унификация
разделение доступа и предоставление полного окружения разным непривилигированым пользователям
скорость в прод (можем больше зарабатывать, но не экономить)

chroot
  network
  processes
  
jail 
  freebsd 4.0
  network + (ip)
  - no resource managment

openvz

man 7 namespace 
  cgroup
  ipc
  network
  mount
  pid
  user
  uts (hostname nis domain name)
  
утилиты для работы с namespaces
  unshare
  nsenter
  /rpc/<pid>/ns

mount namespace  
  /tmp (systemd PrivateTmp)
  chroot в mount namespace
    mount -o bind
    pivot_root

https://ru.wikipedia.org/wiki/Iproute2
  ss 
  ip

user and pid namespacre
  /etc/subuid
  /etc/subgid


unshare -m bash

control group
  /cgroups (centos 6)
  /sys/fs/cgroup (systemd mounts tree with controller)

  
mkdir mygroup
echo $$ > tasks
cat tasks
  17016 (bash)
  17109 (cat)

cat memory.usage_in_byes
echo xx > memory.limit_in_bytes

какого черта?

swapoff -a
  echo usage > limit 
  bash -> killed

umount -la 
  -l - lazy

cgroup v2 
  linux 5.2  

centos 7, 8
  systemd-nspawn

machinectl
  nsenter -t 1868 -m -n
  machinectl terminate test

