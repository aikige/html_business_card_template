#!/bin/bash
export PATH=/Applications/Google\ Chrome.app/Contents/MacOS:$PATH
if [[ "$OSTYPE" == "cygwin" ]]; then
	function chrome() {
		export PATH="/c/Program Files/Google/Chrome/Application:$PATH"
		echo chrome.exe $@
		chrome.exe $@
	}
	function adjpath() {
		cygpath -m $(realpath $1)
	}
else
	function chrome() {
	  echo Google\ Chrome $@
	  Google\ Chrome $@
	}
	function adjpath() {
		# Note: system default `realpath` has different behavior
		# and GNU version (`grealpath`) is required.
		grealpath $1
	}
fi
opt="--headless --disable-gpu"
#opt="--headless=new --remote-debugging-port=0"
if [[ "$2" =~ _l\.png$ ]]; then
	# 97x61mm in px.
	px_size=${PX_SIZE-"367,231"}
	opt+=" --screenshot=$(adjpath $2) --window-size=$px_size"
elif [[ "$2" =~ _p\.png$ ]]; then
	#px_size=${PX_SIZE-"231,367"}
	px_size=${PX_SIZE-"231,500"}
	opt+=" --screenshot=$(adjpath $2) --window-size=$px_size"
elif [[ "$2" =~ \.pdf$ ]]; then
	opt+=" --print-to-pdf=$(adjpath $2)"
fi
opt+=" --virtual-time-budget=1000"
#opt+=" --timeout=1000"
chrome $opt $(adjpath $1)
