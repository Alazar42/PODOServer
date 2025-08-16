#!/bin/sh
echo -ne '\033c\033]0;PODO SERVER\a'

base_path="$(dirname "$(realpath "$0")")"
PORT=${PORT:-8080}   # use Render's $PORT, fallback to 8080 locally

"$base_path/PODO_SERVER.x86_64" --port $PORT "$@"
