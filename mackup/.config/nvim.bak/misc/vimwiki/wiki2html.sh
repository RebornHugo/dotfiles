#!/bin/bash

# env HUGO_baseURL="file:///home/${USER}/Documents/vimwiki/_site/" \
#     hugo --themesDir ~/Documents/ -t vimwiki \
#     --config ~/Documents/vimwiki/config.toml \
#     --contentDir ~/Documents/vimwiki/content \
#     -d ~/Documents/vimwiki/_site --quiet > /dev/null

# golang
# env HUGO_baseURL="~/Workspace/Writing/VimWikiHTMLtest/" \
#     hugo --themesDir ~/Documents/ -t vimwiki \
#     --config ~/Documents/vimwiki/config.toml \
#     --contentDir ~/Documents/vimwiki/content \
#     -d ~/Workspace/Writing/VimWikiHTMLtest --quiet > /dev/null

# pandoc
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"

# Added ones
TEMPLATE_PATH="$7"
TEMPLATE_DEFAULT="$8"
TEMPLATE_EXT="$9"
ROOT_PATH="${10}"

[[ "$ROOT_PATH" = "-" ]] && ROOT_PATH=''


FILE=$(basename "$INPUT")
FILENAME=$(basename "$INPUT" ."$EXTENSION")
FILEPATH=${INPUT%$FILE}
OUTDIR=${OUTPUTDIR%$FILEPATH*}
OUTPUT="$OUTDIR"/$FILENAME
CSSFILENAME=$(basename "$6")
FULL_TEMPLATE="$TEMPLATE_PATH/$TEMPLATE_DEFAULT$TEMPLATE_EXT"

# HAS_MATH=$(grep -o "\$\$.\+\$\$" "$INPUT")
HAS_MATH=$(grep -o "\$.\+\$" "$INPUT")
if [ -n "$HAS_MATH" ]; then
    MATH="--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
else
    MATH=""
fi

# >&2 echo "MATH: $MATH"

sed -r 's/(\[.+\])\(([^)]+)\)/\1(\2.html)/g' <"$INPUT" | pandoc $MATH --template="$FULL_TEMPLATE" -f "$SYNTAX" -t html -c "$CSSFILENAME" -M root_path:"$ROOT_PATH" | sed -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g; s/<li>(.*)\[X\]/<li class="todo done4">\1/g' > /tmp/crap.html
# sed -r 's/(\[.+\])\(([^)]+)\)/\1(\2)/g' <"$INPUT" | pandoc $MATH --template="$FULL_TEMPLATE" -f "$SYNTAX" -t html -c "$CSSFILENAME" -M root_path:"$ROOT_PATH" | sed -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g; s/<li>(.*)\[X\]/<li class="todo done4">\1/g' > /tmp/crap.html

# With this you can have ![pic of sharks](file:../sharks.jpg) in your markdown file and it removes "file" 
# and the unnecesary dot html that the previous command added to the image. 
sed 's/file://g' < /tmp/crap.html | sed 's/jpg.html/jpg/g' > "$OUTPUT.html"
