#!/bin/bash

if hash Rscript 2>/dev/null ; then
	Rscript --vanilla src/installPackages.r | tee -a $log_file
else 
	echo 'Rscript is not found in your $PATH. Did you install R-base package?'
fi
