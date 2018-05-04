#!/bin/bash

export LLVM_PATH="/Users/fernando/Programs/llvm38/build/bin"
export CLANG="$LLVM_PATH/clang"
export OPT="$LLVM_PATH/opt"
export LINKER="$LLVM_PATH/llvm-link"
export DIS="$LLVM_PATH/llvm-dis"
rm -rf *.bc *.rbc *.ll *.exe
$CLANG -c -emit-llvm utils.c  -o utils.bc
$CLANG -c -emit-llvm matMul.c -o matMul.bc
$CLANG -c -emit-llvm main.c   -o main.bc
$LINKER *.bc -o app.bc
#$OPT -O3 -disable-inlining app.bc -o app.rbc
$OPT -O3 app.bc -o app.rbc
$DIS app.rbc -o app.ll
$CLANG app.ll -o app.exe
export M=1000
export N=700
export O=600

echo "version, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024"
#for i in `seq 0 6`;
for i in 6;
do
  echo -n "v$i, "
  for s in 1 2 4 8 16 32 64 128 256 512 1024
  do
    ./app.exe $M $N $O $s $i 0
  done
  echo ""
done
