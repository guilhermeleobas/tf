#!/bin/bash

if [[ $EXEC -eq 1 ]]; then
  echo 'STARTING EXECUTION' ;
  parallel --will-cite --tty --verbose --joblog run.log  --jobs $JOBS < /tmp/run.txt ;
fi
