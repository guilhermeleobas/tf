#!/bin/bash

function annotate() {
  
  for file_name in "${source_files[@]}"; do
    
    # ignore _AI.c files in source_files[@]
    if [[ $file_name = *_AI.c ]]; then
      continue
    fi

    f=$(basename $file_name .c) # filename without extension
    bash ${BASEDIR}/runAnalyzesTest.sh $file_name 2> taskminer_$f.out # creates a tmp_AI.c
    mv tmp_AI.c ${f}_AI.c
  done

}
