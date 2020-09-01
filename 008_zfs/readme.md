ZFS

## цели

установить и настроить ZFS;
понимать преимущества и недостатки использования для конкретных задач.

владеть терминологией
pool

## Краткое содержание

плюсы и минусы;
установка;
RAIDZ;
компрессия;
дедупликация;
ARC / L2ARC;
ZIL / SLOG;
команды: zpool, zfs.

## Конспект
FreeNAS
BTRFS

компоненты 
1
  spa - storage pool locator
2
  dmu - data management unit
    transactions
3 
  zfs posix layer
  zfs volume emulator (block-device)


```
zpool create tank mirror sde sdf mirror sdg sdh
zfs create tank/test2
```

data integrity (целостность)
  cow
  transactions
  checksum 
    mercle tree
  redundency
    raidz (raid5) / raid1
      raid 5 - power loose vulnerability
    ditto blocks - 2 copy of metadata
  
кэши для недавних и популянрныйх данных

zil 
  zfs intent log
slog
  separate intent log
    increase write


https://zfsonlinux.org/

zfs not GPL, CDDL - Sun's common development and distritubiont license

install
  kABI-tracking kmod
  DKMS
    kernel module

```
# mirror:
zpool create poolmirror mirror sda sdb
zpool list
zpool status

stripe
zpool create poolstribe mirror sda sdb
zpool destroy stripe  # for adults only


raid 
zpool create raid_pool raidz1 disk1 disk2 (1 disk)

zpool create raid_pool raidz2 disk1 disk2 disk3 (2 disks)

zpool create raid_pool raidz3 disk1 disk2 disk3 disk4 (3 disks)

zpool create hybrid mirror disk1 disk2 mirror disk3 disk4
  raid10 (on write first block to 1st mirror second block to 2nd mirror)

zfs create hybrid
zfs create hybrid/data

zfs set mountpoint=/home/testuser hybrid/data


# quota (max)
zfs get quota
zfs set quota=500M /hubrid/data


dd if=/dev/urandom of=/home/testuser/file bs=1M

# disk quota exceeded

# reservation (garantee)
zfs set reservation=300M /hybrid/video

zfs set compression

zfs set dedup=on /hybrid/texts


zfs snapshot /hybrid/texts@snap001
zfs list -t snapshot
zfs destroy /hybrid/texts@snap001
zfs rollback /hybrid/texts@snap001


zfs send /hybrid/one@snap1 > snap
zfs receive /hybrid/data/ snap

zpool 
```

!! use 
/dev/disk/uuid


https://wintelguy.com/zfs-calc.pl

resilvering
   rearrange data
