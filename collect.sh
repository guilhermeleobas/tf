#!/bin/bash

if [[ $ANALYZE -eq 1 ]]; then 
  # this is left as an example for the user to collect their results.
  csvs=($( find Benchs -name "table.csv" ))
  python3 pyscripts/merge.py "${csvs[@]}" > data/all.csv
fi
