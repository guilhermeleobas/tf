#!/bin/sh

# Command line parameters:
DIFF="diff"
PROG=$1
GOODOUTPUT=$2
TESTOUTPUT=$3
# Output filename:
DIFFOUTPUT=/tmp/${PROG}.diff

# Diff the two files.
$DIFF $GOODOUTPUT $TESTOUTPUT > $DIFFOUTPUT 2>&1 || (
  # They are different!
  echo "******************** TEST '$PROG' FAILED! ********************"
  echo "Execution Context Diff:"
  head -n 200 $DIFFOUTPUT | cat -v
  rm $DIFFOUTPUT
  echo "******************** TEST '$PROG' ****************************"
)
