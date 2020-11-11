## backup
backup, bacula, borg

люди
  делать бэкапы
  веривицировать бэкапы

елси у вас вся истрактутура как кот...
кладбище файлов

для восстановлениея на оригинальном или новом носителе

магнитная лента - очень холодная резервная копия

RTO - recovery time objective
RPO - recovery point objective
PITR - point in time recovery point
backup level 0-1-2
  full 
  differential (diff to full) 
  incremental (inc to prev)
  
backup depth (time to keep)
 
требования к резервной копии
  хранить на отдельном носителе
  надежность
  доступность
  простота

возможные проблемы
  размер - негде хранить
  время получения - слишком долго
  время развертывания
  нагрузка на систему
  бэкап превратился в тыкву

репликация/дублирование
снепшоты
журналирование
зеркалирование

manual
  date+format
  ssh, nfs
  tools
    tar
    rsync
    dump
    dd
    
rsync -delete
robocopy

etckeeper
  apt install etckeeper
  git /etc


rsync
  lsyncd - watch folder

postgresql
  pg_probakcup wal-g, barman

rsync
  quick check
    size, date_modified

