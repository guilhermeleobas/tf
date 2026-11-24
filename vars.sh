# if 0, redirect benchmark output to /dev/null
# if 1, print benchmark output to stdout
[[ -n $DEBUG ]] || DEBUG=0

# Specify the timeout. Default is INF(0)
[[ -n $RUNTIME ]] || RUNTIME=0

# Execute the benchmark
[[ -n $EXEC ]] || EXEC=1

# Compile
[[ -n $COMPILE ]] || COMPILE=1

# Instrument
[[ -n $INSTRUMENT ]] || INSTRUMENT=0

# JOBS
[[ -n $JOBS ]] || JOBS=1

# ANALYZE
[[ -n $ANALYZE ]] || ANALYZE=0

# INSTRUMENT
[[ -n $INSTRUMENT ]] || INSTRUMENT=0

# DIFF
[[ -n $DIFF ]] || DIFF=0

[[ $DIFF -eq 1 && $DEBUG -eq 1 ]] && {
  echo "Can't use DIFF=1 & DEBUG=1 at the same time"
  exit 1
}

# Remove all temp files
[[ -n CLEAN ]] || CLEAN=0

# Set the lib suffix.
suffix="dylib"
if [[ $(uname -s) == "Linux" ]]; then
  suffix="so"
fi

# Homebrew installs GNU timeout as gtimeout on macOS; Pixi uses timeout.
TIMEOUT=timeout
if [[ $(uname -s) == "Darwin" ]] && command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT=gtimeout
fi


# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# Use the active Pixi or conda environment unless LLVM_PATH is set explicitly.
LLVM_PATH="${LLVM_PATH:-${CONDA_PREFIX:+$CONDA_PREFIX/bin}}"

[[ -d "${LLVM_PATH}" ]] || {
	echo "Activate the Pixi environment or set LLVM_PATH before running tf" >&2
	exit 1
}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

# THIS PART IS LEFT AS AN EXAMPLE FOR THE PEOPLE WORKING WITH PIN!

# PIN 
[[ -n $PIN ]] || PIN=0

if [[ $PIN -eq 1 ]]; then
  # PIN_PATH   => The place where I keep the pin source code
	PIN_PATH=""
  [[ -n $PIN_PATH ]] || {
		echo "One must define the PIN before when PIN=1"
		exit 1
	}
  
  # PIN_LIB    => The place where I keep the Pin lib implemented.
	PIN_LIB=""
  [[ -n $PIN_LIB ]] || {
		echo "One must define PIN_LIB when PIN=1"
		exit 1
	}

  # PIN_TOOL   => The tool used
  [[ -z $PIN_TOOL ]] || {
    echo "You must define a PIN_TOOL variable before using tf with PIN"
    exit 1
  }

  # PIN_FLAGS  => Flags to pass to PIN
  [[ -n $PIN_FLAGS ]] || PIN_FLAGS=" "

  echo "PIN_PATH is set to $PIN_PATH"
  echo "PIN_LIB is set to $PIN_LIB"
  echo "PIN_TOOL is set to $PIN_TOOL"
  
  echo "Compiling PIN TOOLS"
  PIN_ROOT=$PIN_PATH make -C $PIN_LIB || {
    echo "Error compiling PIN TOOLS"
    exit 1
  }
  
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # --

# perf
[[ -n $OCPERF ]] || OCPERF=0

if [[ $OCPERF -eq 1 ]]; then
  #PERF EVENT
  [[ -n $PERF_TOOL ]] || PERF_TOOL="mem_uops_retired.all_loads" # mem-stores

  #USER OR KERNEL SPACE
  [[ -n $PERF_TYPE ]] || PERF_TYPE="u"

  #OUTPUT FILE
  [[ -n $PERF_FILE ]] || PERF_FILE="perf_${PERF_TOOL}_${PERF_TYPE}.out"
  
	PERF_BIN=""
	[[ -n $PERF_BIN ]] || {
		echo "One must define PERF_BIN when PERF=1"
		exit 1
	}
  
  echo "PERF_BIN is set to $PERF_BIN"
  echo "PERF_TOOL is set to $PERF_TOOL"
  echo "PERF_TYPE is set to $PERF_TYPE"
fi

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

BASEDIR="$(pwd)"

BENCHSDIR="$BASEDIR/Benchs/"

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- 

echo "#########################"
echo "DEBUG is set to $DEBUG"
echo "RUNTIME is set to $RUNTIME"
echo "CLEAN is set to $CLEAN"
echo "PIN is set to $PIN"
echo "EXEC is set to $EXEC"
echo "COMPILE is set to $COMPILE"
echo "INSTRUMENT is set to $INSTRUMENT"
echo "suffix is set to $suffix" # .so or .dylib
echo "BASEDIR is set to $BASEDIR"
echo "Benchmarks dir is set to $BENCHSDIR"
echo "PASS is set to $PASS"
echo "DIFF is set to $DIFF"
echo "#########################"
