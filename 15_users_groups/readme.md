## 
Алексей Цыкунов

аутентификация - подтверждение личности (паспорт)
  ввод логин, пароль
авторизация - охранник проверяет можно ли вам войти
аккаунтинг - запись в журнале

appArmor
PolicyKit
PAM

cat /etc/passwd
cat /etc/shadow

/sbin/nologin

/etc/login.defs
CREATE_HOME yes
UMASK 077

useradd
usermod

набор прав применяется при логине

newgrp zabbix
  touch test1
  newgrp zabbix
  touch test

root
  /etc/passwd
  uid - 0

suid 4000 u+s
  chmod ls u+s
sgid 2000 
  chmod g+s myfolder
    cd myfloder
    touch test 

sticky bit 1000
  +t
  удалять владелец файла или владелец каталога
  
umask 
  вычитаемая маска
  002
  
------------------------------------------
man capabilities
  80, 443
  CAP_SYS_ADMIN
  tcpdump

process
  cat /proc/123/status
  CapInh: xxx
    capsh --decode=xxx
  getpcaps

file
  getcap /user/sbin/tcpdump
  setcap
  tcpdump -i eth0

getcap /usr/bin/ping
setcap -r cap_net_admin /usr/bin/ping
  

capsh --print

CAP_NET_BIND_SERVICE (запуск на системном порту)

setup cap_net_raw-ep /usr/bin/pin

--------------
polkit - policy kit

--------------

ls file (see drwxrwx---+)
getfacl file

расширенные атрибуты (файловой системы)
  man chattr
    chattr
    lsattr
  i - неизменяемый
  s - перезаись нулями
  а - только добавление
  
pam 
  plugable authorization module
  ldd /usr/sbin/sshd |grep pam
    libpam.so
  cd /etc/pam.d/
  cat sshd
    structure: type control module args
    обработка сверху вниз как в апитейбл

AppArmor
  per application
  /etc/apparmor.d/
    setup capability
