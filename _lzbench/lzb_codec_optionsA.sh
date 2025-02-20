#!/bin/sh

for f in *.cpp~; do F=${f/\~/}; lzb_codec_options1.sh $f > $F; done
