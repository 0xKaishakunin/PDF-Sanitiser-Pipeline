#!/bin/bash
IN_DIR="${IN_DIR:-input}"
OUT_DIR="${OUT_DIR:-output}"

for pdf in "$IN_DIR"/*.pdf;
do
	base=$(basename "$pdf" .pdf)
    zeitstempel=$(date +%y%m%d%H%M)
    tmp_pdf=$(mktemp --suffix=.pdf)
    out_pdf="$OUT_DIR/${base}-${zeitstempel}.pdf"
	
	mutool clean -gggg "$pdf" "$tmp_pdf"
	gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dCompatibilityLevel=1.7  -o "$out_pdf" "$tmp_pdf"

done
