#!/bin/bash

log_file='run.log'

if hash Rscript 2>/dev/null ; then
	Rscript --vanilla main.r | tee -a $log_file
else 
	echo 'Rscript is not found in your $PATH. Did you install R-base package?'
fi
