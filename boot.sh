#!/bin/bash
set -e
PORT="${PORT:-8080}"
mkdir -p /workspace
chown server:server /workspace
export HOME=/home/server
export SHELL=/bin/bash
cd /workspace
exec gosu server /usr/bin/ttyd --port "$PORT" --interface 0.0.0.0 --writable tmux new -A -s main
