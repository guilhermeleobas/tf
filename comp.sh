#!/bin/bash

function compile() {
  
  gcc-6 $CXXFLAGS -g "${source_files[@]}" -lm -o $exe_name

}
