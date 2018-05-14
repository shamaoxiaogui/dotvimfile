#!/bin/bash

PROJECT_PATH=$(cd `dirname $0`; pwd)
VIMRC_FILE="$PROJECT_PATH/.vimrc"
VIMRUNTIME_DIR="$PROJECT_PATH/.vim"

export MYVIMRC="$VIMRC_FILE"
vim -p -N -n -i NONE -u "$VIMRC_FILE" "$@"
