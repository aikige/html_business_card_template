#!/bin/bash
export PATH=/Applications/Google\ Chrome.app/Contents/MacOS:$PATH
if [[ "$2" =~ _l\.png$ ]]; then
	# 97x61mm in px.
	px_size=${PX_SIZE-"367,231"}
	opt="--screenshot=$2 --window-size=$px_size"
elif [[ "$2" =~ _p\.png$ ]]; then
	px_size=${PX_SIZE-"231,367"}
	opt="--screenshot=$2 --window-size=$px_size"
fi
opt=${opt-"--print-to-pdf=$2"}
Google\ Chrome --virtual-time-budget=1000 --headless --disable-gpu $opt $1
#Google\ Chrome --virtual-time-budget=1000 --headless=new $opt $1
