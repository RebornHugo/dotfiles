#!/bin/sh
# NOTICE: this file need to be excutable...
# Just set chmod +x ~/.config/lf/previewer.sh


# bat --color always "$@"

FILE="${1}"
WIDTH="${2}"
HEIGHT="${3}"

case "$(file --mime-type $f -b)" in
    # text/*) bat --color always "${FILE}";;
    # */pdf) $qlmanage -p "${FILE}";;
    *) bat --color always "${FILE}";;
#   *) echo "not txt";;
esac
