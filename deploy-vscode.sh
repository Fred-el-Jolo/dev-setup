#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

cd /home/frederic/tools/vscode/

if [[ ! -f "$1" ]]; then
    echo "$1 does not exists."
    exit 1
fi

tar -xzf $1 -C vscode-vue --strip 1
echo "vscode-vue updated"

tar -xzf $1 -C vscode-rust --strip 1
echo "vscode-rust updated"
