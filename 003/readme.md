# задание

Работа с LVM
на имеющемся образе
/dev/mapper/VolGroup00-LogVol00 38G 738M 37G 2% /

уменьшить том под / до 8G

https://linoxide.com/how-tos/how-extend-resize-lvm-partition-linux/

```
# unmount volume
df -hP
/dev/mapper/vg--01-lv_stripe 1008M   55M  902M   6% /mnt/lv_stripe

umount: /: target is busy.
# umount /mnt/lv_stripe

filesystem check
# e2fsck -f /dev/vg-01/lv_stripe 

3) Resizing filesystem
resize filesystem
resize2fs -p /dev/vg-01/lv_stripe 800M

4) Reducing the LV size
lvreduce -L 8G /dev/mapper/VolGroup00-LogVol00 

# mount /dev/vg-01/lv_stripe /mnt/lv_stripe/
```


выделить том под /home
выделить том под /var
/var - сделать в mirror
/home - сделать том для снэпшотов
прописать монтирование в fstab

попробовать с разными опциями и разными файловыми системами ( на выбор)
- сгенерить файлы в /home/
- снять снэпшот
- удалить часть файлов
- восстановится со снэпшота
- залоггировать работу можно с помощью утилиты script

* на нашей куче дисков попробовать поставить btrfs/zfs - с кешем, снэпшотами - разметить здесь каталог /opt
Критерии оценки: основная часть обязательна
задание со звездочкой +1 балл


# tips and notes:

https://linux.die.net/man/8/lvm


```
vagrant destroy
vagrant up
vssh

lsblk
fdisk -l
df -h


yum install lvm2
```


```
pv 
  physical volume
    physical extent
      4 mb (4kb - 16gb)
vg
  volume group
lv 
  logical volume
    logical extent
fs
  file system
    /home 
    /var 
```
