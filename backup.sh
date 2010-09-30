#!/bin/bash
#Encoding: UTF-8
 
#============================================================================
#
#  Program: backup.sh
#  Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >
#
#  Last modified: 2010/09/30 16:05
#
#============================================================================
 
DATA=$(date "+%Y%m%d")
HORA=$(date "+%H%M%S")

for i in $(ls -A1)
do
   if [ ! -d ~/backup-$DATA$HORA ]
   then
      echo -e "\r\n Script de backup iniciado... \r\n"
      sleep 1
      echo -e "\033[0;32m O diretório\033[0;31m backup-$DATA$HORA\033[0;32m NÃO existe ...\033[0m"
      sleep 1
      echo -e "\033[0;32m Criando diretório\033[0;31m backup-$DATA$HORA\033[0;32m ...\033[0m \r\n"
      mkdir -p ~/backup-$DATA$HORA
      sleep 1
   fi
   if [ -d $i ]
   then
      echo -e "\033[0;32m DIRETÓRIO \033[0m \t $i "
      echo -e "\t\t Agrupando arquivos de\033[0;32m $i\033[0m no tarball backup_$DATA$HORA-$i.tar..."
      tar -cf backup_$DATA$HORA-$i.tar $i
      sleep 1
      echo -e "\t\t Comprimindo tarball\033[0;32m backup_$DATA$HORA-$i.tar\033[0m com algoritmo LZMA..."
      lzma --best backup_$DATA$HORA-$i.tar
      sleep 1
      echo -e "\t\t Movendo\033[0;32m backup_$DATA$HORA-$i.tar.lzma\033[0m para o diretório de backup..."
      mv backup_$DATA$HORA-$i.tar.lzma ~/backup-$DATA$HORA
      echo -e "\r\n"
   else
      echo -e "\033[0;34m ARQUIVO \033[0m \t $i "
      if [ ! -f backup_$DATA$HORA-homefiles.tar ]
      then
         echo -e "\t\t \033[0;32m O arquivo\033[0;31m backup_$DATA$HORA-homefiles.tar\033[0;32m NÃO existe ...\033[0m"
         echo -e "\t\t \033[0;32m Criando arquivo\033[0;31m backup_$DATA$HORA-homefiles.tar\033[0;32m ...\033[0m"
         echo -e "\t\t Adicionando arquivo\033[0;32m $i\033[0m ao tarball backup_$DATA$HORA-homefiles.tar..."
         tar -cf backup_$DATA$HORA-homefiles.tar $i
         sleep 1
         echo -e "\r\n"
      else
         echo -e "\t\t Adicionando arquivo\033[0;32m $i\033[0m ao tarball backup_$DATA$HORA-homefiles.tar..."
         tar -uf backup_$DATA$HORA-homefiles.tar $i
         sleep 1
         echo -e "\r\n"
      fi
   fi
done
echo -e "\t\t Comprimindo tarball\033[0;32m backup_$DATA$HORA-homefiles.tar\033[0m com algoritmo LZMA..."
lzma --best backup_$DATA$HORA-homefiles.tar
echo -e "\t\t Movendo\033[0;32m backup_$DATA$HORA-homefiles.tar.lzma\033[0m para o diretório de backup..." 
mv backup_$DATA$HORA-homefiles.tar.lzma ~/backup-$DATA$HORA
echo -e "\r\n"
echo -e "\033[1;32m BACKUP REALIZADO COM SUCESSO!\033[0m \r\n"

