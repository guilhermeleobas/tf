
if [[ $EXEC -eq 1 ]]; then
  echo 'STARTING EXECUTION' ;
  parallel --verbose --joblog run.log  --jobs $JOBS < run.txt ;
fi
