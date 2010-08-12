#!/bin/bash
if [ $# -lt 1 ]; then
	echo "Usage: $0 <number>"
	echo "Put the number of digits desired to the password that you want to create."
	exit 1
fi
caracteres=(a b c d e f g h i j k l m n o p q r s t u v w y x z 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V X W Y Z)
total=(${#caracteres[*]})
for ((i=1; i<=$1; i++))
do
	Valor=$((RANDOM%$total))
	String="$String${caracteres[$Valor]}"
done
echo
echo " Sua senha ==> $String "
echo

