
## grep, sed, awk и другие

## Цели занятия


## Краткое содержание

## Конспект

sysV
  плохое упрвление
    нет pid 
    дваойной запуск
    абандонт
  monit
  
  
systemd
  форкинг (запускает процесс с другім підом)

systemd 
  systemd-boot uefi
  udevd - менеджер устройств (поддержка актуальности /dev)
  tmpfiles (управленіе времменнымі)
  jornald
  networkd

systemctl --all
  defivces, services, timers etc
  
man systemd.index
apropos systemd

цель 
  cron
  мониторинг и рестарт
  снепшот состояній се

systemctl status
systemd-(tab)

systemd target
  runlevel

poweroff.target   0
resuce.target     1 (single user)
multi-user.target 2,3,4 (4 - one app)
graphical.target  5
reboot.target     6


systemd-analyze
sysctl list-dependencies --reverse


systemctl start $target.target

cgroups (управление ограничение аудит)

jornalctl (logs)

cgroup (объект сессия)
slice (tree for user.pid)
scope (объект в slice)

systemd-cgtop


systemd.unit
  3 sections

unit types:
  target
  service (default)
  timer

  device
  mount
  automount

/usr/lib/systemd/system
man systemd.unit
/etc/systemd

systemctl

unit status
  started
  enabled (on restart)
  stopped ()
  disabled (on restart)
  masked  
    systemctl mask logrotate.service

секция юнита

edit unit (!systctl restart) 
  daemon-reload


systemctl cat sshd
```
[Unit]
[unit type (Service)]
[Install]
```

systemctl show sshd
systemctl show sshd



ulimit -a
  (pid limits)
  use at service level


restart
  no
  always
  on-success
  on-failure
  on-abnormal
  on-abort
  on-watchdog

активация по сокету?

