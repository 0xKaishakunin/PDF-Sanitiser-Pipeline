#!/bin/bash
IN_DIR="${IN_DIR:-input}"

for pdf in "$IN_DIR"/*.pdf;
do
	base=$(basename "$pdf" .pdf)
    zeitstempel=$(date +%y%m%d%H%M)
    tmp_pdf=$(mktemp --suffix=.pdf)

	mutool clean -gggg "$pdf" "/output/$tmp_pdf"

done
