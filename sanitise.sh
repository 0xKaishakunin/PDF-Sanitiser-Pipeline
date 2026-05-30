#!/bin/bash

for pdf in "/input/*.pdf"; 
do
	base=$(basename "$pdf" .pdf)
    zeitstempel=$(date +%y%m%d%H%M)
    tmp_pdf=$(mktemp --suffix=.pdf)

	mutool clean -gggg "$pdf" "/output/$tmp_pdf"

done
