#!/bin/sh

password="password"

CypherAlg[0]="AES256"
CypherAlg[1]="des"
CypherAlg[2]="camellia256"
CypherAlg[3]="bf"

CypherMode[0]="ecb"
CypherMode[1]="cbc"
CypherMode[2]="cfb"


for i in "${CypherAlg[@]}"
do
    for j in "${CypherMode[@]}"
    do
        gpg --cipher-algo $i --output encrypted/$1.$i-$j --symmetric $1
    done
done
