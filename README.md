# tf
Easily run llvm test-suite benchmarks. This is a simple test framework built using bash. 

## What tf can do for you?
- Run programs with [PIN](https://software.intel.com/en-us/articles/pin-a-dynamic-binary-instrumentation-tool)
- Compile and run benchmarks with your own llvm pass
- Parallel execution
- Easily collect statistics
- Run with a time limit

## Benchmarks

Here is a list of benchmarks available in this repo:

- ASCI_Purple
- ASC_Sequoia
- BenchmarkGame
- BitBench
- CoyoteBench
- cpu2006
- Dhrystone
- DOE_ProxyApps_C
- Fhourstones
- Fhourstones_31
- FreeBench
- Linpack
- llubenchmark
- mafft
- MallocBench
- McCat
- McGill
- mediabench
- MiBench
- Misc
- nbench
- NPB-serial
- Olden
- PAQ8p (**C++**)
- Prolangs-C
- Ptrdist
- SciMark2-C
- Shootout
- sim
- Stanford
- tramp3d-v4 (**C++**)
- Trimaran
- TSVC
- VersaBench

## Execute Benchmarks

Make sure you have installed on your computer the following tools:

- timeout or gtimeout if you're on osx ([brew](https://stackoverflow.com/questions/3504945/timeout-command-on-mac-os-x) is your friend)
- gnu-parallel for parallel execution

The first thing you need to do is select which benchmarks you want to execute. Open `build_exec.sh`, go to the end of the file and replace the `benchs` variable. 

Now, there is a bunch of ways you can execute the benchmarks.
1) `TIMEOUT=2m INSTRUMENT=0 ./build_exec.sh` 
This will compile and execute each benchmark inside `benchs` with a timeout of 2 minutes.
2) `INSTRUMENT=0 COMPILE=1 EXEC=0 ./build_exec.sh`
This will only compile the benchmarks and dump the commands to execute each benchmark in a file called `run.txt`. We can use this file to execute things in parallel using `gnu-parallel`. We will see that in a bit.
3) `INSTRUMENT=0 COMPILE=1 EXEC=0 PIN=1 ./build_exec.sh`
Does the same thing as the command above but execute things inside PIN. Note that you need to change the script (lines `90-95`) to specify a few things:
	- `PIN_PATH` must point to where pin is installed. 
	- `PIN_LIB` must point to where your Pintool **source code** is (Just don't include the `obj-intel64/MyPinTool.so` part). This way we can compile your lib before executing it. Also, if your Pintool calls something other than `MyPinTool.so`, you need to change the code (line `191`). 
	- `PIN_FLAGS` is the flags you want to pass to pin
4) `TIMEOUT=0 INSTRUMENT=0 ./build_exec.sh`
Compile each benchmark and run **without** a timeout.

### TIPS
Compiling all benchmarks takes about 1 hour on OpenCL. It's a good idea to compile before and execute them later. 

1) To compile:
`COMPILE=1 INSTRUMENT=0 EXEC=0 ./build_exec.sh`
2) Execute sequentially:
`COMPILE=0 INSTRUMENT=0 EXEC=1 ./build_exec.sh` 
Or in parallel:
`COMPILE=0 INSTRUMENT=0 EXEC=0 ./build_exec.sh`
`JOBS=njobs ./parallel.sh`

By default we send the output of each benchmark to `/dev/null` but you can send it to `/dev/stdout` setting the variable `DEBUG=1`.

`RUNTIME` receives a floating point number followed by an optional unit:
- `s` for seconds (the default)
- `m` for minutes
- `h` for hours
- `d` for days


## How to collect stats
1) Run benchmarks using the `parallel.sh` script. Set the `JOBS=1` if you want to run them sequentially.
2) `parallel.sh` creates a logfile called `run.log` in the same directory. 

The log contains the job sequence, which host the job was run on, the start time and run time, how much data was transferred, the exit value, the signal that killed the job, and finally the command being run.

You can easily parse the logfile to a csv using python and [pandas](https://pandas.pydata.org/):

```python
import pandas as pd
pd.read_csv('run.log', sep='\t').to_csv('run.csv')
```

## Compiling with your llvm pass
In the script `build_exec.sh`, change the function `compile` and add your pass when calling `opt`.

## Instrumenting
1) Change the function `instrument()` and add your llvm pass when calling `opt`.
2) Set `INSTRUMENT=1` when calling `build_exec.sh`


## Adding more benchmarks

1) For each folder that contains .c files, i.e., the folder that will
   contain the executable file that you are creating, add the following
   `info.sh` file there:
```bash
 bnc_name="XX" ;
 lnk_name="$bnc_name.rbc" ;
 prf_name="$bnc_name.ibc" ;
 obj_name="$bnc_name.o" ;
 exe_name="$bnc_name.exe" ;

 source_files=($(ls *.c)) ;
 CXXFLAGS=" -lm " ;
 COMPILER="clang"  # or clang++
 RUN_OPTIONS=" irsmk_input " ;
 STDIN=" file.in "
```
2) Add a function into `build_exec.sh`, for the new benchmark.

If the benchmark does not contain subfolders, add:
```bash
function Fhourstones() { 
	walk "." ; 
}
```
otherwise, add:
```bash
function Misc() { 
	dirs=($( ls -d */ )) ;
	walk "${dirs[@]}" ; 
}
```

See the lines `314-346` to see how we do in the benchmarks we already have.
