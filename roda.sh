
CLEAN=1 ./run.sh
COMPILE=1 INSTRUMENT=0 EXEC=0 JOBS=1 PASS=DAG ./run.sh benchs.txt

for i in `seq 1 5`; do
  COMPILE=0 INSTRUMENT=0 EXEC=1 JOBS=1 PASS=DAG ./run.sh benchs.txt
  mv run.log runs/run_O3_$i.log
done

####

CLEAN=1 ./run.sh
COMPILE=1 INSTRUMENT=1 EXEC=0 JOBS=1 PASS=DAG PASS_OPT="inner" ./run.sh benchs.txt

for i in `seq 1 5`; do
  COMPILE=0 INSTRUMENT=1 EXEC=1 JOBS=1 PASS=DAG PASS_OPT="inner" ./run.sh benchs.txt
  mv run.log runs/run_dag_inner_$i.log
done

###

CLEAN=1 ./run.sh
COMPILE=1 INSTRUMENT=1 EXEC=0 JOBS=1 PASS=DAG PASS_OPT="outer" ./run.sh benchs.txt

for i in `seq 1 5`; do
  COMPILE=0 INSTRUMENT=1 EXEC=1 JOBS=1 PASS=DAG PASS_OPT="outer" ./run.sh benchs.txt
  mv run.log runs/run_dag_outer_$i.log
done

###

CLEAN=1 ./run.sh
COMPILE=1 INSTRUMENT=1 EXEC=0 JOBS=1 PASS=DAG PASS_OPT="no" ./run.sh benchs.txt

for i in `seq 1 5`; do
  COMPILE=0 INSTRUMENT=1 EXEC=1 JOBS=1 PASS=DAG PASS_OPT="no" ./run.sh benchs.txt
  mv run.log runs/run_dag_no_$i.log
done

###

CLEAN=1 ./run.sh
COMPILE=1 INSTRUMENT=1 EXEC=0 JOBS=1 PASS=DAG PASS_OPT="silent" ./run.sh benchs.txt

for i in `seq 1 5`; do
  COMPILE=0 INSTRUMENT=1 EXEC=1 JOBS=1 PASS=DAG PASS_OPT="silent" ./run.sh benchs.txt
  mv run.log runs/run_dag_silent_$i.log
done
