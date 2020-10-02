
## Цели занятия
монтировать файловые системы с помощью FUSE;
настраивать и использовать NFS.

## Краткое содержание
NFS - версии, процесс, протокол взаимодействия;
параметры сервера;
параметры клиента;
FUSE - принципы работы;
SSHFS - как пример FUSE;
NFS-ganesha.

## Результаты
NFS.

# задание

Vagrant стенд для NFS или SAMBA
NFS или SAMBA на выбор:

vagrant up должен поднимать 2 виртуалки: сервер и клиент
на сервер должна быть расшарена директория
на клиента она должна автоматически монтироваться при старте (fstab или autofs)
в шаре должна быть папка upload с правами на запись
- требования для NFS: NFSv3 по UDP, включенный firewall

* Настроить аутентификацию через KERBEROS


# как проверять

# tips and notes: