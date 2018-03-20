
[[ -n $JOBS ]] || JOBS=10 ;

BASEDIR="$HOME/Programs/C" ;

echo 'STARTING EXECUTION IN PARALLEL' ;
parallel --verbose --joblog init.log --jobs $JOBS < init.txt ;
parallel --verbose --joblog run.log  --jobs $JOBS < run.txt ;
parallel --verbose --joblog read.log --jobs $JOBS < read.txt ;

csvs=($( find "$BASEDIR/faun/src/Benchs" -name "*.csv" )) ;
python3 analysis/merge.py "${csvs[@]}" > data/all.csv ;

