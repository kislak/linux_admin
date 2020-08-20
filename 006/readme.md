## цели

объяснить как происходит загрузка системы, в чем разница между BIOS/UEFI;
настраивать GRUB2;
управлять initrd с помощью dracut;
работать с udev;
восстанавливать сломанный загрузчик.

## Результаты

сконфигурировать grub2 и изменить порядок и параметры загрузки.


## задание

Работа с загрузчиком
1. Попасть в систему без пароля несколькими способами
2. Установить систему с LVM, после чего переименовать VG
3. Добавить модуль в initrd

4. (*) Сконфигурировать систему без отдельного раздела с /boot, а только с LVM
Репозиторий с пропатченым grub: https://yum.rumyantsev.com/centos/7/x86_64/
PV необходимо инициализировать с параметром --bootloaderareasize 1m
Критерии оценки: Описать действия, описать разницу между методами получения шелла в процессе загрузки.
Где получится - используем script, где не получается - словами или копипастой описываем действия.

## как проверять

```

```

## конспект

BIOS/UEFI
  check hardware (keyboard, drive)
  boot loader (HDD, floppy, CD, network)

boot loader (grub)
  найти ядро 
  загрузить в память
  передать управление
  
  grub - 25389 байт 1-63 сектор 
    (512 байт MBR) (1 - 1.5 -2 - stages)
    /boot/grub2/i386-pc - load module
    /boot vmlinuz-*.x68 (menu multiple OS)    
    # initrd initramfs-xxx.img
    /proc/cmdline


  UEFI (micro OS)
    стартует в защитном режиме
    secure boot (цифровая подпись)
    EFI system partion
      > 2TB
      GPT EFI
      efi internal shell
        > help
        mapping table - disks(blk) fs(fat, ext4)
        !!! можно запусить программу  

  (lvm, iscsi, raid)
  корневая файловая система
    /bin, /sbin, /lib, /usr/lib
    /boot (vmlinuz, initramfs(initrd))
    
    # bsd - all drivers in core (find core - load)
    # module are on drive
    
    initrd
      # монтируется как корневая 
      # загрузка драйверов
      # монтирование /
      zcat /boot/initramfs...
      lsinitrd /boot/initramf...
////
module initrd

mkdir usr/lib/dracut/modules.d/00test
vim module-setup.sh
vim test.sh
chmod +x test.sh
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(unmae -r)

jornalctl -і
что происходило во время загрузки? 

#!/bin/bash
check() {
  return 0
}
depend() {
  return 0
}

install() {
  inst_hook cleanup 00 "${moddir}/test.sh"
}


////
ядро
  инициализация устройств
  загрузка драйверов
  запускае систему инициализации (процесс PID1)

процесс PID1
  запускает строку приглашения



modify load params 
(cat /proc/cmdline)
  # old
    configs files 
    /boot/grub/ *.cfg
  # new
    grubby
      cat /boot/loader/entries/ *.conf # BootLoaderSpec
      cat /etc/readhat-release
  # univeral 
    vim /etc/default/grub
    grub2-mkconfig -o /boot/grub2/grub.cfg

параметры ядра
https://www.kernel.org/doc/html/v4.14/admin-guide/kernel-parameters.html
  not https://docs.google.com/document/d/1c6DM3vJ06-SSESpWpWk_vaZy4bvL1CUrFV81cPNGy4c/edit
  output to serial port

xpe 
  ip udp dhcp tftp
      
## tips and notes:

корневая файловая система недоступна
  stop grub - e (1.08) - ctrl+x
  how to reset root password
    rd.break - pivot_root()
    ls /sysroot/
      (protect grub with password)
      mount -o remount,rw /sysroot/
      mount |grep sysroot
      chroot /sysroot/
      passwd
      cat /etc/passwd (cat /etc/shadow)
      touch /.autorelabel # selinux
      mount -o remount,ro /sysroot/
      reboot      

  reset password 2 (ubuntu)
    init=/sysroot/bin/sh
  reset password 3
    systemd.unit=emergency.target
    systemd.unit=rescue.target
    
  grubby --info=ALL
  grubby --remove-args="rhgb quiet" --update-kernel /boot/vmlinuz...

\\\\\\\\\\\\

efibootmgr - update UEFI from cmd 


```
cat /proc/cmdline
ls /boot

```
