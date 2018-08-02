export LLVM_PATH="$HOME/Programs/llvm38/build/bin"

export BASEDIR="$(pwd)"

export TESTDIR="$BASEDIR/Benchs"

if [[ $(uname -s) == "Linux" ]]; then
  export SUFFIX="so"
else
  export SUFFIX="dylib" # osx
fi
