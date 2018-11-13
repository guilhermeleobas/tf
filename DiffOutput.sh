#!/bin/sh

# Command line parameters:
DIFF="diff"
PROG=$1
GOODOUTPUT=$2
TESTOUTPUT=$3
# Output filename:
DIFFOUTPUT=/tmp/${PROG}.diff

# Diff the two files.
$DIFF $GOODOUTPUT $TESTOUTPUT > $DIFFOUTPUT 2>&1

if [[ $? -eq 0 ]]; then
  echo ""
  echo "******************** TEST '$PROG' SUCCEED! ********************"
else
  # They are different!
  echo ""
  echo "******************** TEST '$PROG' FAILED! ********************"
  echo "Execution Context Diff:"
  head -n 10 $DIFFOUTPUT | cat -v
  # rm $DIFFOUTPUT
  echo "******************** TEST '$PROG' ****************************"
  exit 1
fi
