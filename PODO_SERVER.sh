#!/bin/sh
echo -ne '\033c\033]0;PODO SERVER\a'

base_path="$(dirname "$(realpath "$0")")"
PORT=${PORT:-8080}   # Render provides $PORT dynamically

# Run Godot headless dedicated server, bind to all interfaces
"$base_path/PODO_SERVER.x86_64" --headless --server --port $PORT --bind 0.0.0.0 "$@"
