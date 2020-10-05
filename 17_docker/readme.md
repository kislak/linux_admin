## SELinux

Павел Викирюк

security enhanced linux
mandatory access control
система принудительного контроля доступа

national security agency 
  NSA

1998 - initial release
 
lsm 
  selinux - 2003 kernel 2.6
  alternative to selinux: apparmor - 2009 - 2.6.36 

разграничение доступа с фиксированным набором полномочий


why
  ограничение прав пользователей и процессов на уровне ядра
  работа с DAC (discretional access control)
  снижение риска ошибок (кода, и конфига)
  ограничение опасных процессов в провах
  протоколирование (бесплатно и без смс)


факты
  большие сложные политики
  кто должен писать политики (разработчики софта, поддержка дистрибутива)
  минимальные расходы на работу системы

  
субъект - пользователь или процесс
объект (файл)

MLS 
  multi level security (уровни)
    модель белла-лападулы
    вертикальный уровень контроля
    используем метки
    сложное проектирование
MCS 
  multi category security (категории)

RBAC - role based access control
  linux account - selinux user - selinux roles - selinux domains


SE users
  system_u
  root
  user_u

SE roles
  user_r
  staff_r
  sysadm_r
  system_r
  
SE domain, type
  user_t
  mysqld_db_t
  
TE
  type enforcement

context
  extended attrs - role, type, domain

domain 
  list of activities subject can do on object
  user_t
  
type
  object attribute - define subject who can access 
role
  

``` 
ls -Z /proc
ps -Z

id -Z
  unconfined
```


/opt 
  не работает selinux
  можно запускать что угодно

```
/etc/selinux/targeted/contextes/files/
/etc/selinux/config
sestatus
/sys/fs/selinux

setenforce 0
setenforce 1
getenforce

```

sshd_config
Port 5022
audit2why < /var/log/audit/audit.log

netstat -lntp

```
semanage port -a -t ssh_port_t -p tcp 5022
```


sealert -a /var/log/audit/audit.log

getsebool -a | grep samba
setsebool -P samba_sahre_fusefs on

samba_share_nfs on
samba_create_home_dir

