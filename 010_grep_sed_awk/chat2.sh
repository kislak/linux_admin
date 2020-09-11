filename=chat2.txt

get_number_of_active(){
  # написать функцию которая подсчитывает количество участников
  cut -f 3 -d ':' | cut -f 3,4 -d ' ' | sort | uniq | wc -l
}
get_top_active_students(){
  # написать функцию которая покажет 10 самых активных
  cut -f 3 -d ':'
}

echo Number of students:
cat $filename | get_number_of_active
# head $filename
echo
echo Active students:
#cat $filename | get_top_active_students
