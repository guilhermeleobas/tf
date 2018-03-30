#!/bin/bash

THIS=$(pwd)
LLVM_PATH="$HOME/Programs/llvm37/build/bin"

export CLANG="$LLVM_PATH/clang"
export CLANGFORM="$LLVM_PATH/clang-format"
export OPT="$LLVM_PATH/opt"
export LINKER="$LLVM_PATH/llvm-link"
export DIS="$LLVM_PATH/llvm-dis"

export BUILD="$HOME/Programs/taskminer/build-debug"

export PRA="$BUILD/PtrRangeAnalysis/libLLVMPtrRangeAnalysis.so"
export AI="$BUILD/AliasInstrumentation/libLLVMAliasInstrumentation.so"
export DPLA="$BUILD/DepBasedParallelLoopAnalysis/libParallelLoopAnalysis.so"
export DLM="$BUILD/DivergentLoopMetadata/libDivergentLoopMetadata.so"
export CP="$BUILD/CanParallelize/libCanParallelize.so"
export PLM="$BUILD/ParallelLoopMetadata/libParallelLoopMetadata.so"
export WAI="$BUILD/ArrayInference/libLLVMArrayInference.so"
export CDA="$BUILD/ControlDivergenceAnalysis/libControlDivergenceAnalysis.so"
export ST="$BUILD/ScopeTree/libLLVMScopeTree.so"
export WTM="$BUILD/libLLVMTaskFinder.so"

export XCL="-Xclang -load -Xclang"
# export OMP="-I/home/kezia/2015/openmp/runtime/exports/common/include"
export OMP="-I $HOME/Programs/llvm38/build-omp/projects/openmp/runtime/src"
export FLAGS="-mem2reg -tbaa -scoped-noalias -basicaa -functionattrs -gvn -loop-rotate -instcombine -licm"
export FLAGSAI="-mem2reg -loop-rotate"
#-instnamer -loop-rotate"

export RES="result.bc"

export PATH=$PATH:/home/periclesrafael/openmp4/llvm/install/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/periclesrafael/openmp4/llvm/install/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/periclesrafael/openmp4/llvm/install/include

TMP_FILE="tmp.c"

rm result.bc result2.bc

echo "Running $1..."

$CLANGFORM -style="{BasedOnStyle: llvm, IndentWidth: 2, ColumnLimit: 0}" ${THIS}/$1 &> ${THIS}/$TMP_FILE

# mv tmp.txt ${THIS}/$1

bash $HOME/Programs/tf/scopetest.sh ${THIS}/$TMP_FILE

$CLANG $OMP $COMP_FLAGS -lm -g -S -emit-llvm ${THIS}/$TMP_FILE -o result.bc 

#OPT -mem2reg -instnamer result.bc -o result.mem.bc
#OPT -load $WTM -taskminer result.mem.bc

$OPT -load $ST -instnamer -mem2reg -scopeTree result.bc 

$OPT -load $ST -load $WTM -load $WAI -instnamer -mem2reg -writeInFile -Run-Mode=true \
   -debug-only=print-tasks -S result.bc -o result2.bc

$CLANGFORM -style="{BasedOnStyle: llvm, IndentWidth: 2}" ${THIS}/$TMP_FILE &> tmp.txt

mv tmp.txt ${THIS}/$TMP_FILE
