#!/bin/bash

clang -O3 utils.c matMul.c main.c -o app.exe

export M=1000
export N=700
export O=600

echo "version, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024"
for i in `seq 0 6`;
do
  echo -n "v$i, "
  for s in 1 2 4 8 16 32 64 128 256 512 1024
  do
    ./app.exe $M $N $O $s $i 0
  done
  echo ""
done
