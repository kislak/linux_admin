## mysql


mysql 8.0 v

default root connect from localhost

alter user 'root'@localhost' idnetified with mysql_native_passsword by 'Otus321$'

alter user 'root'@localhost' idnetified with caching_sha2_password by 'Otus321$'

sudo -u root -p 

.my.cnf (config file)
password="Otus321$"



cat /etc/mysql/mysql.conf.d/mysqld.cnf
  bind_address = 127.0.0.1
  ip a

telnet 127.0.0.1 3306

log
  statement-based 
    unsafe timestamp
  row-based
  mixed
    safe/unsafe (pick statement/row)
  
replicate
  innodb_read_only - enable
  

бэкап 
  логический (sql) // mysqldump > 1.sql
  физический (bin-логи)
  сторонние ПО
  


