
## ansible
Альбрехт Леонид dba

## Цели занятия
автоматизировать рутинные задачи администрирования;
изучить ansible - инвентори, модули, плейбуки, роли, переменные; 
объяснить разницу с другими инструментами - chef/puppet/salt.

Результаты
освоить популярный и полезный инструмент администратора - Ansible. 
Могут с помощью него изменить конфигурационные файлы, 
установить дополнительный софт и произвести другие действия.


```
yum install ansible
pip3 install aansible
```


системы управления конфигурациями

управление конфигурацией - процесс устанвки и поддержки продукта на протяжении ЖЦ
  повторное испльзование кода
  версионирование
  совместная работа
  самодокументирование

ansible - mutable infra
docker - immutable infrastructure

ansible - procedural (chef)
puppet - delcarative

client only
  ssh & pithon
  but ansible tower (awx) - client-server
  

https://galaxy.ansible.com/
  search roles

redhat support

for networks:
https://github.com/natenka/Ansible-for-network-engineers/blob/master/docs/source/contents.rst
https://ansible-for-network-engineers.readthedocs.io/ru/latest/



config
  https://docs.ansible.com/ansible/2.4/intro_configuration.html
  ansible.cfg
    ini
    inventory path
    ssh, paramica
    /etc/ansible.cfg
  inventory
    proxy servers
    db servers
    groups (inner groups)
    ini or yaml (prefer)
    > ansible-inventory -i 
  assets (cert, key, sql)
  docs
  tests

module (example)
yum:
  name: epel-release
  state: present

vagrant ssh-config

ad-hoc
  ansible -i inventory -m ping proxy #(module ping)
  -|- shell -a 'honstname| wc -l'
  -|- command -a 'hostname'

ansible-playbook site.yml (steps to get result)

variables 
  facts
  https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html
  >ansible -e var1=myvar


adv-it
  для чотких пацанчиков
  https://www.youtube.com/watch?v=Ck1SGolr6GI&list=PLg5SS_4L6LYufspdPupdynbMQTBnZd31N

molecule ansible - test automation

-----------------

## roles

```
ansible-galaxy init roles/nginx
```

playbook gets very simple

repo for each role - with tags v1.2.1

requirements.yml
- src: https://github.com/geerlingguay/ansible-role-nginx
  version: 1.2.1

```   
ansible-galaxy install -r requriements.yml
```
decompostion
  - include_tasks: install.yml
  include_role:
    name: xxx

handlers/notify (reload nginx)

- naame: 'conf'
  templaate:
    src: ''
    dest: ''
  notify: "reload nginx"
  shell: 'nginx -t && nginx reload'
  
- name: 'reload nginx'
  systemd
    name: nginx
    state: reload

ansible-vault encrypt_string --vaault-id ops@paassfile 'secret123' --name pg_password

nginx_port: !valut |
  $ansible_vault;1.2;aes256;ops


https://github.com/ansible/awx

oh-my-tmux
oh-my-fish
NERDtreeToggle (vim plugin)
