#
# Executes commands at the start of an interactive session.
#
# PATH settings
typeset -U path PATH

# Set the HOMEBREW_PREFIX based on the system architecture
if [ -d /opt/homebrew ]; then
  HOMEBREW_PREFIX=/opt/homebrew
elif [ -d $HOME/homebrew ]; then
  HOMEBREW_PREFIX=$HOME/homebrew
else
  HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
fi

path=(
  $HOMEBREW_PREFIX/bin(N-/) # Homebrew executables
  $HOMEBREW_PREFIX/sbin(N-/) # Homebrew system binaries
  /usr/bin # System executables
  /usr/sbin # System system binaries
  /bin # Essential executables
  /sbin # Essential system binaries
  /usr/local/bin(N-/) # Local executables
  /usr/local/sbin(N-/) # Local system binaries
  $HOME/.nodebrew/current/bin(N-/) # Nodebrew executables
  $HOME/.go/bin(N-/) # Go executables
  /home/linuxbrew/.linuxbrew/bin(N-/) # Linuxbrew executables
  /home/linuxbrew/.linuxbrew/sbin(N-/) # Linuxbrew system binaries
  /opt/homebrew/bin/node(N-/)
  /snap/bin(N-/)
)

# rbenv
if type rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - zsh)"
fi

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases
if [ -f $HOME/.config/shell/aliases ]; then
    source $HOME/.config/shell/aliases
fi

# secret (API keys, etc.)
if [ -f $HOME/.zsh_secret ];then
    source $HOME/.zsh_secret
fi

# node, npm, nvm, and nodebrew
if [ -f $HOME/.zsh_node ]; then
    source $HOME/.zsh_node
fi

# go
export GOPATH=$HOME/.go

if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

# fzf
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'

# others
export EDITOR=nvim
