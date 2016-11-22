#!/bin/bash

password="password"

CypherAlg=( "aes-256" "des" "camellia-256" "bf")
CypherMode=( "ecb" "cbc" "cfb")


mkdir -p encrypted/$1


exec 3>&1 4>&2 >encrypted/$1/readme 2>&1

for i in "${CypherAlg[@]}"
do
    for j in "${CypherMode[@]}"
    do
        echo
        echo
        echo
        echo
        echo $1 $i-$j
        echo "Cipher:"
        /usr/bin/time -v openssl $i-$j -in $1 -out encrypted/$1/$1.$i-$j -k ${password}
	echo "Decipher:"
	/usr/bin/time -v openssl $i-$j -d -in encrypted/$1/$1.$i-$j -out $1 -k  ${password} 
    done
done

# restore stdout and stderr
exec 1>&3 2>&4
