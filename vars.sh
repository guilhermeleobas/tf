#!/bash/bin

# if 0, redirect benchmark output to /dev/null
# if 1, print benchmark output to stdout
[[ -n $DEBUG ]] || DEBUG=0 ;

# Specify the timeout
[[ -n $RUNTIME ]] || RUNTIME=8m ;

# Execute the benchmark
[[ -n $EXEC ]] || EXEC=1 ;

# Compile
[[ -n $COMPILE ]] || COMPILE=1 ;

# JOBS
[[ -n $JOBS ]] || JOBS=1 ;

# Set the lib suffix.
suffix="dylib" ;
if [[ $(uname -s) == "Linux" ]]; then
  suffix="so" ;
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# LLVM_PATH  => The place where I have all the LLVM tools
LLVM_PATH="$HOME/Programs/llvm38/build/bin"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# THIS PART IS LEFT AS AN EXAMPLE FOR THE PEOPLE WORKING WITH PIN!

# PIN 
[[ -n $PIN ]] || PIN=0 ;

if [[ $PIN -eq 1 ]]; then
  # PIN_PATH   => The place where I keep the pin source code
  PIN_PATH="$HOME/Programs/Pin"
  
  # PIN_LIB    => The place where I keep the Pin lib implemented
  PIN_LIB="$HOME/Programs/C/faun/src/PinLib/"
  
  # PIN_FLAGS  => Flags to pass to PIN
  PIN_FLAGS="" ;
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

BASEDIR="$(pwd)"

TESTDIR="$BASEDIR/Benchs/"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

echo "#########################"
echo "DEBUG is set to $DEBUG"
echo "RUNTIME is set to $RUNTIME"
echo "PIN is set to $PIN"
echo "EXEC is set to $EXEC"
echo "COMPILE is set to $COMPILE"
echo "suffix is set to $suffix"
echo "BASEDIR is set to $BASEDIR"
echo "TESTDIR is set to $TESTDIR"
echo "#########################"