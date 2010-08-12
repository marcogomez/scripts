#!/bin/sh
GBRANCH=$(git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\*\ \(.+\)$/\(\\\1\)\ /)
echo -n $GBRANCH

