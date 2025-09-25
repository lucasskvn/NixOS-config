# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
# Utilise ~/.oh-my-zsh s'il existe, sinon celui du système NixOS
if [ -d "$HOME/.oh-my-zsh" ]; then
  export ZSH="$HOME/.oh-my-zsh"
else
  export ZSH="/run/current-system/sw/share/oh-my-zsh"
fi
export PATH="$HOME/delivery/my_scripts:/etc/nixos/config/my_scripts:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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
plugins=(git)
plugins+=(aliases)
plugins+=(catimg)
plugins+=(kitty)
# Ne pas déclarer ces plugins via OMZ (pas présents sous $ZSH/plugins)
# On les source depuis Nix ci-dessous
# plugins+=(zsh-autosuggestions)
# plugins+=(zsh-syntax-highlighting)

# Completion tuning (placed before omz init)
mkdir -p "$HOME/.cache/zsh/zcompcache"
zmodload zsh/complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"

source $ZSH/oh-my-zsh.sh

# Suggestions automatiques (NixOS installe dans share/zsh/plugins)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
if [ -f /run/current-system/sw/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /run/current-system/sw/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f "$HOME/.nix-profile/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.nix-profile/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Raccourcis pour zsh-autosuggestions
bindkey '^ ' autosuggest-accept       # Ctrl+Espace pour accepter la suggestion
bindkey '^[ ' autosuggest-toggle      # Alt+Espace pour activer/désactiver

# Surlignage syntaxique (doit être chargé en dernier)
if [ -f /run/current-system/sw/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /run/current-system/sw/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f "$HOME/.nix-profile/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.nix-profile/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# History and shell options
mkdir -p "$HOME/.local/share/zsh"
export HISTFILE="$HOME/.local/share/zsh/history"
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# Quality-of-life options
setopt AUTO_CD
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt COMPLETE_IN_WORD
setopt GLOB_DOTS
setopt NUMERIC_GLOB_SORT

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
 #alias zshconfig="mate ~/.zshrc"
 #alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/lucasskvn/.spicetify

# Définir un widget qui exécute 'fg'
function fg-widget() {
  fg
  zle reset-prompt
}
zle -N fg-widget

# Associer CTRL+F au widget (CTRL+F = ^F)
bindkey '^F' fg-widget

# Keybindings for common keys
bindkey -e
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Aliases
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --icons=auto --color=always -F'
  alias ll='eza -la --group-directories-first --icons=auto'
  alias lt='eza -a --tree --level=2'
else
  alias ls='ls --color=auto -F'
  alias ll='ls -alF --color=auto'
fi
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

# Helpful functions
extract() {
  local archive="$1"
  [[ -f "$archive" ]] || { echo "No such file: $archive"; return 1; }
  case "$archive" in
    *.tar.bz2)   tar xjf "$archive"   ;;
    *.tar.gz)    tar xzf "$archive"   ;;
    *.tar.xz)    tar xJf "$archive"   ;;
    *.tar.zst)   tar x --zstd -f "$archive" ;;
    *.tbz2)      tar xjf "$archive"   ;;
    *.tgz)       tar xzf "$archive"   ;;
    *.zip)       unzip "$archive"     ;;
    *.rar)       unrar x "$archive"   ;;
    *.7z)        7z x "$archive"      ;;
    *.tar)       tar xf "$archive"    ;;
    *)           echo "Unsupported archive format"; return 1 ;;
  esac
}

serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

path() {
  echo "$PATH" | tr ':' '\n'
}

# Optional tool integrations
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# fzf (completions + keybindings)
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  elif command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g !.git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
  if [ -f /run/current-system/sw/share/fzf/key-bindings.zsh ]; then
    source /run/current-system/sw/share/fzf/key-bindings.zsh
    [ -f /run/current-system/sw/share/fzf/completion.zsh ] && source /run/current-system/sw/share/fzf/completion.zsh
  elif [ -f "$HOME/.nix-profile/share/fzf/key-bindings.zsh" ]; then
    source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"
    [ -f "$HOME/.nix-profile/share/fzf/completion.zsh" ] && source "$HOME/.nix-profile/share/fzf/completion.zsh"
  elif [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
  fi
fi

# Better man page colors
export LESS='-R'
export LESSHISTFILE='-'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Laisser Starship gérer le prompt (garder tout à la fin)
eval "$(starship init zsh)"