#!/usr/bin/env bash

ROOT=$(
  cd "$(dirname "$0")"
  pwd
)

rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
rm -f "$HOME/.bash_profile"
rm -f "$HOME/.bashrc"
rm -f "$HOME/.config/shell/aliases"
rm -f "$HOME/.tmux.conf"
rm -f "$HOME/.screenrc"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zpreztorc"
rm -f "$HOME/.config/nvim/init.lua"
rm -f "$HOME/.config/nvim/lazy-lock.json"
rm -f "$HOME/.config/nvim/lua/autocmds.lua"
rm -f "$HOME/.config/nvim/lua/keymaps.lua"
rm -f "$HOME/.config/nvim/lua/options.lua"
rm -f "$HOME/.config/nvim/lua/plugins.lua"
rm -f "$HOME/.config/nvim/lua/base.lua"
rm -f "$HOME/.config/nvim/lua/colorscheme.lua"
rm -f "$HOME/.config/nvim/lua/coc.lua"

"$ROOT/install.sh"
