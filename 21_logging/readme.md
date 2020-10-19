## Сбор и анализ логов

rsyslog logrotate
jornald
abrtd
auditd
kdump


cat /var/log/syslog - deb
cat /var/log/messages - rpm

auth 
  /var/log/auth.log
  /var/log/secure

/var/log/dmesg 
  dmesg -H
  dmesg -l err


/var/log
  anaconda - установка системы 
  audit
  boot
  cron
  yum.log
  emerge.log (gentoo)
  dpkg.log
  mysql
  apache2
  nginx

utils
  tail -f
  cat | grep -e 'smth' 
  zcat
  zgrep
  zmore
  lnav

lnav


/etc/rsyslog.conf
/etc/rsyslog.d/sftp.conf
  module(load="imuxsock")
  if $programmname == 'internaal-sft' then /var/log/sftp.log 
  & stop

input module: imtcp, ...
output module: omfile, ...
parser module: pmciscoios, ...

facility - категория 

severity
  emergency 0 - debug 7
  
see wiki/syslog

exp:
kern.* 
mail.crit
chron.!info,!debug 


logrotate
  rotate - n logs
  dateext
  compress
  copytruncate
  mail
    console client: sendmail, postfix
  maxsize
/etc/logrotate.d/nginx

  /var/log/nginx/*.log {
  }

man logrotate

apply
logrotate -v /etc/logrotate.conf

journald
  binary
  
abrtd
  bug reports  

kdump
  rpm - kernal panic
  
  
