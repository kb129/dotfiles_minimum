#!/usr/bin/env bash

set -eu

ROOT=$(
  cd "$(dirname "$0")"
  pwd
)

if [ -n "${ZDOTDIR:-}" ]; then
  ZDOT_BASE="$ZDOTDIR"
else
  ZDOT_BASE="$HOME"
fi

PREZTO_DIR="$ZDOT_BASE/.zprezto"
if [ "$PREZTO_DIR" = "/" ] ||
  [ "$PREZTO_DIR" = "$HOME" ] ||
  [ "$(dirname "$PREZTO_DIR")" = "/" ] ||
  [ "$(basename "$PREZTO_DIR")" != ".zprezto" ]; then
  echo "Refusing to remove $PREZTO_DIR" >&2
  exit 1
fi

if [ -e "$PREZTO_DIR" ]; then
  echo "Removing $PREZTO_DIR"
  rm -rf "$PREZTO_DIR"
fi
rm -f "$HOME/.bash_profile"
rm -f "$HOME/.bashrc"
rm -f "$HOME/.config/shell/aliases"
rm -f "$HOME/.tmux.conf"
rm -f "$HOME/.screenrc"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zpreztorc"
rm -f "$HOME/.gdbinit"
rm -f "$HOME/.config/nvim/init.lua"
rm -f "$HOME/.config/nvim/lazy-lock.json"
rm -f "$HOME/.config/nvim/lua/autocmds.lua"
rm -f "$HOME/.config/nvim/lua/keymaps.lua"
rm -f "$HOME/.config/nvim/lua/options.lua"
rm -f "$HOME/.config/nvim/lua/plugins.lua"
rm -f "$HOME/.config/nvim/lua/base.lua"
rm -f "$HOME/.config/nvim/lua/colorscheme.lua"
rm -f "$HOME/.config/nvim/lua/coc.lua"

echo "Running install.sh"
"$ROOT/install.sh"
