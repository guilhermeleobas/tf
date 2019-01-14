#!/bin/bash

trap 'echo "killing annotate.sh" ; return 1' KILL 

function annotate() {
  
  for file_name in "${source_files[@]}"; do
    
    # ignore _AI.c files in source_files[@]
    if [[ $file_name = *_AI.c ]]; then
      continue
    fi

    f=$(basename $file_name .c) # filename without extension
    $TIMEOUT --signal=KILL 5m ${BASEDIR}/runAnalyzesTest.sh $file_name 2> taskminer_$f.out # creates a tmp_AI.c
  
    mv tmp_AI.c ${f}_AI.c
    
    if [[ $? -ne 0 ]]; then
      report="file $file_name broke during annotation phrase. Jumping to next benchmarks"
      echo $report
      echo "$file_name,broken" >> /home/gleison/tf/report.csv
      return 1 ;
    else
      report="file $file_name annotated"
      echo $report
      echo "$file_name,annotated" >> /home/gleison/tf/report.csv
    fi
  done
  
  return 0 ;
}
