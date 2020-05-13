#!/bin/bash

# generate confusion matrices, precision-recall curves, thresholds, etc.
 
# accuracy.sh <config-file> <logdir> <precision-recall-ratios>

# e.g.
# $DEEPSONG_BIN accuracy.sh `pwd`/configuration.sh `pwd`/trained-classifier 2,1,0.5

configfile=$1
logdir=$2
precision_recall_ratios=$3

source $configfile

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

expr="$DIR/accuracy.py $logdir $precision_recall_ratios $accuracy_nprobabilities $accuracy_parallelize"

cmd="date; hostname; $expr; sync; date"
echo $cmd

logfile=$logdir/accuracy.log

accuracy_it "$cmd" "$logfile"