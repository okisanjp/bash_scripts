#!/bin/bash

#
# make backup file with datetime
#

if [ -n "$1" ]; then
	cp $1{,.`date +%Y%m%d%H%M`}
	else
		echo "usage: cpd [filename]" 1>&2
fi