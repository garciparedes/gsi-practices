#!/bin/sh

password="password"

CypherAlg=( "aes-256" "des" "camellia-256" "bf")
CypherMode=( "ecb" "cbc" "cfb")


for i in "${CypherAlg[@]}"
do
    for j in "${CypherMode[@]}"
    do
        mkdir -p encrypted/$1
        echo
        echo
        echo
        echo
        echo $1 $i-$j

        time openssl $i-$j -in $1 -out encrypted/$1/$1.$i-$j -k ${password}
        time openssl $i-$j -d -in encrypted/$1/$1.$i-$j -out $1 -k  ${password}

    done
done
