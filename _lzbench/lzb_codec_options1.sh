#!/bin/sh

F="$1"
cat "$F" | awk '{if(($1 == "int64_t") && ($2 ~ /lzbench_/)){print $1, $2, $3, $4, $5, $6, $7, $8, $9, "struct lzb_codec_options *codec_options)";} else {print $0;} }'
