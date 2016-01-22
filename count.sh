#!/bin/bash

dir="$1"
cmd="ls"

if [ ! -z "$dir" ]; then
	cmd+=" "$dir
fi

dirlst=`$cmd`

arr=( `for x in ${dirlst[@]}; do echo $x; done | sort` )

abc=( {a..z} )

counter=0
firstlettercounter=0
dirname=${arr[$firstlettercounter]}

#find how many characters before reaching 'a', case insensitive
shopt -s nocasematch

while [[ ${dirname:0:1} != [a-z] ]]
do
((firstlettercounter++))
dirname=${arr[$firstlettercounter]}
done

shopt -u nocasematch

arrlength=${#arr[@]}
letterCount=0

for ((j=firstlettercounter;j<arrlength; j++))
do
dirname=${arr[$j]}

if [ ${dirname:0:1} == ${abc[$counter]} ]; then
        ((letterCount++))
else
        echo "${abc[$counter]} $letterCount"
        letterCount=0
        ((counter++))
        ((j--))
fi

done
echo "${abc[$counter]} $letterCount"