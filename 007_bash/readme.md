## цели

писать скрипты на языка bash.

профайл;
переменные;
логические операции;
массивы;
условия;
циклы;
функции.

## Результаты

сконфигурировать grub2 и изменить порядок и параметры загрузки.


## задание

Пишем скрипт
написать скрипт для крона
который раз в час присылает на заданную почту
- X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- все ошибки c момента последнего запуска
- список всех кодов возврата с указанием их кол-ва с момента последнего запуска
в письме должно быть прописан обрабатываемый временной диапазон
должна быть реализована защита от мультизапуска
Критерии оценки:
трапы и функции, а также sed и find +1 балл

## как проверять

```

```

## конспект

Алексей Цикунов
написание скриптов
управлять вводом/выводом

for all users:
/etc/profile (login shell)
/etc/profile.d - aliases.sh

.bash_profile # - on login
.bashrc # on session 

echo $PATH

type cd
type cp

test the same as [[ ]]

man apropos whatis info
man -a intro

yum list bash
yum install bash-completion

bash hot keys
  ctrl a
  ctrl e

  cd \
  dir1

history
  !111


first; then_second
first & second_in_bg
first && second_if_first_success
first || second_if_not_first


дескрипторы файлов
ls -l /dev/std*
  /dev/stdin  /proc/self/fd/0
  /dev/stdout /proc/self/fd/1
  /dev/stderr /proc/self/fd/2

bash test.sh > log_1 &
bash test.sh > /dev/null 2>&1 & 
bash test.sh 2>&1 >/dev/null &

&> /dev/nul

lsof -p <PID>

/proc/<PID>/fd

# все есть таблица

pipe 
  |
  mkfifo my_pipe
  grep ".hml" < myPipe
  ls -l > my_pipe

mysql < soruce.sql


-----------------
$* - все аргументы 
err(){
  echo "E: $*" >> /dev/stderr
}

err "haha"

{
  echo 'haha'; ls ;
} > output


echo "$HOME"
echo '$HOME'

--------------
wc -l << EOF 
  one
  two
  three
EOF


read one two <<< "hello world"
echo $one

cat << EOF > hello.sh
#!/bin/bash
echo "hello"
exit 0
EOF


----------------
she-bang
.test.sh

bash var.sh
source var.sh

ls hasdf; echo $?

```bash
export var=value
var=value
declare var2=test #to all children
var=`ls`
var=$(uname -r)

var=$((1+2))
var=$(expr 1 + 2 )
var2=
var2="${var2:-default value}"

var2=3 bash hello.sh #pass var to script
```

$@ - params in column
@* - params in row
$0 - script name
$# - number of params
$$ - pid
$! pid of last bg
  3.sh 2>&1 & - два один пуск

-----------
array.sh
files=$(ls);for FILE in $files;do file $FILE; done

array=('first one' 'second' 'third')
IFS=$'\n'
echo "${array[*]}"

-----------
hash.sh

declare -A array
array[one]='adin 1'
array[two]='dva 2'
echo "${array[one]}"


---------------
if [[ $check = y -o "$answer" = yes ]]

----------
if_case.sh


case $1 in
--help)
  echo "help"
  ;;
-pa)
  echo "$1"
  ;;&
-p*)
  echo "and $1"
else)
  echo "ok"
esac

-----
if
if [[ -d $dir ]]
-d -directory?
-z -empty
-n -not empty

string
  =, ==
  !=

int
  eq
  ne
  lt
  le
  gt
  ge

----------------
loop1.sh

for server in `cat $HOME/linux_list`
do 
  ssh root@$server $1
done

break & continue

-----------------
set -x #debug

set -C # no override by >
echo test > myfile


set -o noclobber
trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT KILL
trap - INT TERM EXIT
  /tmp/my_pid_file

  kill -l - signals

crontab -e
  0 * * * * source .bash_profile;

