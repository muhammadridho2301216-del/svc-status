#!/bin/bash
set -e
PORT="${PORT:-8080}"
mkdir -p /workspace
PERSISTENT_HOME=/workspace/.home/server
mkdir -p "$PERSISTENT_HOME" "$PERSISTENT_HOME/.config" "$PERSISTENT_HOME/.local" "$PERSISTENT_HOME/.cache"
chown server:server /workspace "$PERSISTENT_HOME" "$PERSISTENT_HOME/.config" "$PERSISTENT_HOME/.local" "$PERSISTENT_HOME/.cache"
export HOME="$PERSISTENT_HOME"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export SHELL=/bin/bash
cd /workspace
exec gosu server /usr/bin/ttyd --port "$PORT" --interface 0.0.0.0 --writable tmux new -A -s main
