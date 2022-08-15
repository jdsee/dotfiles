# ---------------------------------------------------------------------------------
# ZSH - CONFIG
# ---------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# SOURCES
source "${ZINIT_HOME}/zinit.zsh"          # docs: https://zdharma-continuum.github.io/zinit/wiki/
source ${XDG_CONFIG_HOME}/zsh/aliases.zsh
source ${XDG_CONFIG_HOME}/zsh/completion.zsh
source ${XDG_CONFIG_HOME}/zsh/functions.zsh

export GPG_TTY=$(tty)                                               # required by gpg-agent
export MANPAGER="sh -c 'col -bx | bat -l man -p'"                   # use bat as manpager

# OPTIONS
export HISTCONTROL=ignoreboth                                       # ignore commands with space prefix in history
setopt HIST_IGNORE_ALL_DUPS                                         # ignore history duplicates
setopt inc_append_history                                           # sync history between tmux windows
set -s histappend                                                   # append to history

# SETUP SSH AGENT
eval "$(ssh-agent)" >/dev/null

# PYENV
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ZOXIDE (autojump)
eval "$(zoxide init zsh --cmd j)"

# set -o vi                                                           # enable vim mode

# PLUGINS
zinit ice wait'!0'
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'   # pure theme
zinit light sindresorhus/pure                                       # "
zinit light zsh-users/zsh-syntax-highlighting                       # syntax highlighting
zinit light zsh-users/zsh-autosuggestions                           # autosuggestions
zinit light ajeetdsouza/zoxide                                      # autojump

# PURE
# PURE_PROMPT_SYMBOL=𝚲
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

