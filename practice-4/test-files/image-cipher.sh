head -c 54 image.bmp > header.txt
tail -c +55 image.bmp > body.bin

openssl enc -aes-128-ecb -nosalt -k password -in body.bin -out body.ecb.bin
openssl enc -aes-128-cbc -nosalt -k password -in body.bin -out body.cbc.bin

cat header.txt body.ecb.bin > image.ecb.bmp
cat header.txt body.cbc.bin > image.cbc.bmp

rm body.bin body.ecb.bin body.cbc.bin header.txt
