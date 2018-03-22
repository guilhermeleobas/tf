
echo 'STARTING EXECUTION' ;
parallel --verbose --joblog run.log  --jobs $JOBS < run.txt ;
