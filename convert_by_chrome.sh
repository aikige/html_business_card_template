#!/bin/sh
export PATH=/Applications/Google\ Chrome.app/Contents/MacOS:$PATH
Google\ Chrome --headless --disable-gpu --print-to-pdf=$2 $1
