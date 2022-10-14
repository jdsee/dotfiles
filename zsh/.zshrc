# ---------------------------------------------------------------------------------
# ZSH - CONFIG
# ---------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BOOTSTRAP ZNAP
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

# Load prompt before everything else
source ~/Git/zsh-snap/znap.zsh # https://github.com/marlonrichert/zsh-snap
znap prompt sindresorhus/pure

# SOURCES
source ${XDG_CONFIG_HOME}/zsh/aliases.zsh
source ${XDG_CONFIG_HOME}/zsh/completion.zsh
source ${XDG_CONFIG_HOME}/zsh/functions.zsh

export GPG_TTY=$(tty) # required by gpg-agent
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # use bat as manpager

# OPTIONS
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.zsh-history
export HISTCONTROL=ignoreboth # ignore commands with space prefix in history
setopt HIST_IGNORE_ALL_DUPS   # ignore history duplicates
setopt append_history

# PLUGINS
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source ajeetdsouza/zoxide

# SETUP ZOXIDE
eval "$(zoxide init zsh --cmd j)"

# SETUP SSH AGENT
eval "$(ssh-agent)" >/dev/null

# PYTHON
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pyenv pyenv 'eval "$( pyenv virtualenv-init - )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip 'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip


# THEME
# PURE_PROMPT_SYMBOL='𝚲'
PURE_NODE_ENABLED=0
PURE_CMD_MAX_EXEC_TIME=0

zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:execution_time color white
zstyle :prompt:pure:prompt:success color white

autoload -U colors && colors
RPROMPT='$(check_last_exit_code)'

# ZSH KEY-BINDINGS
bindkey '^O'          autosuggest-accept

# FZF KEY-BINDINGS
source /usr/share/fzf/key-bindings.zsh
export FZF_TMUX=0
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Shortcut to gitignore.io API
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

alias luamake=/Users/jdsee/.config/nvim/lua-language-server/3rd/luamake/luamake


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
