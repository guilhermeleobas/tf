#!/bin/bash

function compile() {

  # source_files is the variable with all the files we're gonna compile

  files=$(ls -d *_AI.c)
  cmd="gcc-6 -lm -fopenmp  $files  -o $exe_name" ;
  eval $cmd ;

}
