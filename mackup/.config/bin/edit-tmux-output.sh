#!/bin/bash

file=$(mktemp).sh
tmux capture-pane -pS -32768 >$file
tmux new-window "($EDITOR '+ normal G $' '+SessionStop' $file) && (rm $file)"
