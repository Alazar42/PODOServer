#!/bin/sh
echo -ne '\033c\033]0;PODO SERVER\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/PODO SERVER.x86_64" "$@"
