#!/bin/bash

function execute() {
  
  exe=$exe_name ;

  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe=INS_$exe_name
  fi
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    exe=SAN_$exe_name
  fi
  
  if [[ "$(pwd)" =~ "/cBench/" ]]; then
    for i in $(seq 1 $CBENCH); do
      cmd="./__run $i $exe"
      echo "cd $(pwd) && $cmd" >> /tmp/run.txt
    done
    return
  fi

  if [[ $DIFF -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN &> $bench_name.output && \
         $BASEDIR/DiffOutput.sh $bench_name $bench_name.reference_output $bench_name.output"
  elif [[ $HYPERFINE -eq 1 ]]; then
    cmd="hyperfine \"./$exe $RUN_OPTIONS < $STDIN > $STDOUT 2> $STDOUT \" -w 1 -r 4 --show-output --export-csv time_$exe.csv -u second  "
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN &> $STDOUT"
  fi

  echo "$cmd"
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    echo "cd $(pwd) && ASAN_SYMBOLIZER_PATH=$HOME/Programs/llvm61/build/bin/llvm-symbolizer ASAN_OPTIONS=halt_on_error=false:print_stats=true $cmd" >> $BASEDIR/run.txt
  else
    echo "cd $(pwd) && $cmd" >> /tmp/run.txt
  fi
}
