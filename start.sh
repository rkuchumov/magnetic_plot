#!/bin/bash

if hash Rscript 2>/dev/null ; then
	Rscript --vanilla main.r
else 
	echo 'Rscript is not found in your $PATH. Did you install R-base package?'
fi
