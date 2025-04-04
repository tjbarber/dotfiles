# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-vi-mode)
plugins=(git)
ZVM_INSERT_MODE_CURSOR=$icur'\e\e]12;#47BAC0\a'
ZVM_NORMAL_MODE_CURSOR=$ncur'\e\e]12;#E4609B\a'
ZVM_VI_HIGHLIGHT_FOREGROUND=#535353
ZVM_VI_HIGHLIGHT_BACKGROUND=#323232

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -d "$HOME/.asdf" ]; then
  . "$HOME/.asdf/asdf.sh"
fi

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

path+=("$HOME/.local/scripts")

export VISUAL=nvim
export EDITOR="$VISUAL"

if [ $(uname) = "Linux" ] && [ $XDG_SESSION_TYPE != 'wayland' ]; then
  setxkbmap -option "ctrl:nocaps"

  if lspci -nn | grep -q "RTX 3070"; then
    export WLR_NO_HARDWARE_CURSORS=1
    export WLR_RENDERER=vulkan

    alias sway="sway --unsupported-gpu"
  fi
fi

if [ $(uname) = "Darwin" ]; then
  export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
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

bindkey -s '^F' "tmux-sessionizer\n"

source $HOME/Projects/dotfiles/secrets.sh
