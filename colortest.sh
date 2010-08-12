#!/bin/bash
 
# Marco Antonio Gomez (AptScience.com): 2010/08/08 09:57
# Criado com: vim  =) (Encoding:UTF-8) 

#=======================================================
# ANSI escape-sequence: {ESC}{bg/fg}{attr}{color}m
#
# {ESC}  or \033 represents the ANSI escape-sequence;
# m      means the sequence ends.

ESC="\033["
ATTR="5"     # set to 0 for *no background*  or 1 for *bold*
BGATTR="5;"  # leave it that way (required for background)
BG="48;"     # defines the escape-sequence to background set
FG="38;"     # defines the escape-sequence to foreground set

clear

echo -e "${ESC}39m >> 16 main colors..."
for i in {0..15}
do
	echo -en "\033[38;5;${i}m #${i}#\t"
done

echo
echo -e "${ESC}39m >> 6x6x6 patterns of 256 colors palette..."

a=1
for j in {16..255}
do
	printf "${ESC}${BG}${BGATTR}${j}m${ESC}${FG}${ATTR}15m  %3d  \t" "${j}"
	a=$(echo "$a + 1" | bc)
	if [ $a -gt 6 ]
	then
		a=1
		printf "\n"
	fi
done
echo

