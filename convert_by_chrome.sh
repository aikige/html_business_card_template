#!/bin/bash
export PATH=/Applications/Google\ Chrome.app/Contents/MacOS:$PATH
opt="--headless --disable-gpu"
#opt="--headless=new --remote-debugging-port=0"
if [[ "$2" =~ _l\.png$ ]]; then
	# 97x61mm in px.
	px_size=${PX_SIZE-"367,231"}
	opt+=" --screenshot=$2 --window-size=$px_size"
elif [[ "$2" =~ _p\.png$ ]]; then
	px_size=${PX_SIZE-"231,367"}
	opt+=" --screenshot=$2 --window-size=$px_size"
elif [[ "$2" =~ \.pdf$ ]]; then
	opt+=" --print-to-pdf=$2"
fi
opt+=" --virtual-time-budget=1000"
#opt+=" --timeout=1000"
Google\ Chrome $opt $1
