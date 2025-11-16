#!/usr/bin/env python
######################################################################
# Simple script to crop an image.
######################################################################
import sys
from PIL import Image
import argparse

parser = argparse.ArgumentParser(description='A simple program which crops an image')
parser.add_argument('input_file', help='The input file to be cropped')
parser.add_argument('output_file', help='The output file which stores cropped image. '
                    'This file can be the same file as input_file')
parser.add_argument('crop_cfg', help='x,y,w,h formated string specifies crop area (in pixel)')
args = parser.parse_args()

[x,y,w,h] = map(int,args.crop_cfg.split(','))
with Image.open(args.input_file) as img:
    img.crop((x,y,x+w,y+h)).save(args.output_file)
