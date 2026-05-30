#!/bin/bash

IN_DIR="/srv/DrSchnabel/in"
OUT_DIR="/srv/DrSchnabel/out"


for pdf in "$IN_DIR"/*.pdf;
do
    # Falls Verzeichnis leer ist
    [ -e "$pdf" ] || continue

    base=$(basename "$pdf" .pdf)
    zeitstempel=$(date +%y%m%d%H%M)

    out="$OUT_DIR/${base}-${zeitstempel}.pdf"
    echo "$pdf"
    /bin/firejail --quiet --noprofile --net=none --seccomp --nonewprivs --private --caps.drop=all \
        /bin/mutool clean -gggg  "$pdf"  "$out"
done
