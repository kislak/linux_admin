
## grep, sed, awk и другие

## Цели занятия
работать с многочисленными консольными утилитами в Linux, такими как grep, find, set, cut, tr, vim и так далее;
писать скрипты на awk.


## Краткое содержание
регулярные выражения - grep, egrep
команда find
скрипты на awk
изменения файлов с помощью sed
другие вспомогательные утилиты линукс

## Конспект

```
man man | tac| rev
head tail 
sort uniq
wc -l

paste -s -d ';' teestfile

sort #ctrl + d

cut -f 1,2 -d ":"


tr ':' ' '


cat $filename  | grep -e AM -e PM | sort |rev |cut -f 4- -d ' '|rev|uniq

```

wc - на дверях написано)
wc -l - зависит от размера окна)


grep -A -B -C # after before center
https://www.vidarholen.net/contents/wordcount/

grep -R penguin . > penguin_counter
-o # match only
-w # word (not part of other)
-i # ignore case
-n # numbers
-e # include
-v # --invert-match

vim file_name +88


regexp
  . - any symbol
  [] - class for one symbol (any from [2-5])
  \d
  
"" vs ''
  echo "$HOME" - with expansion 
  echo '$HOME' - with expansion

grep -P 
  - perl
grep -E
  - egrep
  groups
    grep -E '(AM|PM)'  
grep -F
  - fgrep

+*?
  echo abcccc| grep 'bc*'
  echo abccccb| grep 'bc'

https://regex101.com/
https://regexr.com/55ir3


sed
  -d delete
    sed -e '10 d' chat2.txt | nl
    sed -e '/pts/ d' # with regexp
  -s replace
    sed -e "s/USER/user/g" chat2.txt 
    sed -e "90,100 /s/USER/user" chat2.txt
  -i with backup
    sed -i.back '94d' chat2.txt

awk (gawk, mawk, nawk)
  
awk "pattern { action statement }"
pattern - default true
action - print
statement - 

awk -F ':' '{print $3}' /etc/passwd

# awk '1; {print "" }' /etc/passwd

awk '{ print FNR "\t" $0 }' /etc/passwd
awk NF # empty lines 

find 
  find ./ -name '*.rb' -exec wc {} \;
  find /dev -type b


find ./ -exec du {} \;

