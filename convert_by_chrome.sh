#!/bin/sh
export PATH=/Applications/Google\ Chrome.app/Contents/MacOS:$PATH
if [ -n "$PNG" ]; then
	# 97x61mm in px.
	px_size=${PX_SIZE-"367,231"}
	opt="--screenshot=$2 --window-size=$px_size"
fi
opt=${opt-"--print-to-pdf=$2"}
Google\ Chrome --headless --disable-gpu $opt $1
