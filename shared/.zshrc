export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export VISUAL=nvim
export EDITOR="$VISUAL"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto

plugins=(git)
source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.cargo/bin" ]; then
  path+=("$HOME/.cargo/bin")
fi

if [ -d "$HOME/.local/bin" ]; then
  path+=("$HOME/.local/bin")
fi

if [ -d "$HOME/.config/composer/vendor/bin" ]; then
  path+=("$HOME/.config/composer/vendor/bin")
fi

if [ -d "$HOME/go/bin" ]; then
  path+=("$HOME/go/bin")
fi

if [ -d "$HOME/.luarocks/bin" ]; then
  path+=("$HOME/.luarocks/bin")
fi

if [ -d "/opt/homebrew/opt/postgresql@16/bin" ]; then
  path+=("/opt/homebrew/opt/postgresql@16/bin")
fi

if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  if [ -d "/home/linuxbrew/.linuxbrew/opt/postgresql@17" ]; then
    path+=("/home/linuxbrew/.linuxbrew/opt/postgresql@17/bin")
  fi

  if [ -d "/home/linuxbrew/.linuxbrew/opt/libpq" ]; then
    path+=("/home/linuxbrew/.linuxbrew/opt/libpq/bin:$PATH")
  fi
fi

if [ -d "/home/tjbarber/.opencode" ]; then
  path+=("/home/tjbarber/.opencode/bin")
fi

path+=("$HOME/.local/scripts")

if [ $(uname) = "Linux" ] && [ $XDG_SESSION_TYPE != 'wayland' ]; then
  setxkbmap -option "ctrl:nocaps"

  if lspci -nn | grep -q "RTX 3070"; then
    export WLR_NO_HARDWARE_CURSORS=1
    export WLR_RENDERER=vulkan

    alias sway="sway --unsupported-gpu"
  fi
fi

alias gs="git status"
alias gp="git push"
alias gl="git log"
alias gc="git commit -m"
alias ga="git add"
alias gd="git diff"
alias debug="gdb --batch --ex run --ex bt --ex q --args"
alias wip="ga . && gc 'wip'"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias poweroff='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias sl='ls'

bindkey -s '^F' "tmux-sessionizer\n"

source $HOME/Projects/dotfiles/secrets.sh

if MISE_LOCATION=$(which mise 2>/dev/null); then
	eval "$($MISE_LOCATION activate zsh)"
fi
