#!/bin/bash
#Encoding: UTF-8
 
#============================================================================
#
#  Program: fixperm.sh
#  Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >
#
#  Last modified: 2010/08/16 16:01
#
#============================================================================
find . -type d -exec chmod 755 {} \; 
find . -type f -exec chmod 644 {} \;

