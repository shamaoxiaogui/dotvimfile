#!/usr/bin/env bash
set -e
case "$OSTYPE" in
  #solaris*) echo "SOLARIS" ;;
  darwin*)  brew install clang-format; brew install shfmt ;;
  #linux*)   echo "LINUX" ;;
  #bsd*)     echo "BSD" ;;
  #msys*)    echo "WINDOWS" ;;
  *)        echo "OS $OSTYPE not support yet..." ;;
esac

sudo -H pip install yapf; npm install -g js-beautify; npm install -g remark-cli
