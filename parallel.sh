
if [[ $EXEC -eq 1 ]]; then
  echo 'STARTING EXECUTION' ;
  parallel --verbose --joblog init.log  --jobs $JOBS < init.txt ;
  parallel --verbose --joblog run.log  --jobs $JOBS < run.txt ;
  parallel --verbose --joblog read.log  --jobs $JOBS < read.txt ;
fi
