# ---------------------------------------------------------------------------------
# ZSH - CONFIG
# ---------------------------------------------------------------------------------

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/config}
# SOURCES
source "${ZINIT_HOME}/zinit.zsh"          # docs: https://zdharma-continuum.github.io/zinit/wiki/
source $CONFIG_HOME/zsh/aliases.zsh
source $CONFIG_HOME/zsh/completion.zsh
source $CONFIG_HOME/zsh/functions.zsh

export GPG_TTY=$(tty)                                               # required by gpg-agent
export MANPAGER="sh -c 'col -bx | bat -l man -p'"                   # use bat as manpager

# OPTIONS
setopt HIST_IGNORE_ALL_DUPS                                         # ignore history duplicates

# PYTHON
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ZOXIDE
eval "$(zoxide init zsh --cmd j)"

# set -o vi                                                           # enable vim mode

# PLUGINS
zinit ice wait'!0'
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'   # pure theme
zinit light sindresorhus/pure                                       # "
zinit light zsh-users/zsh-syntax-highlighting                       # syntax highlighting
zinit light zsh-users/zsh-autosuggestions                           # autosuggestions
zinit light ajeetdsouza/zoxide                                      # autojump
zinit snippet OMZ::plugins/git/git.plugin.zsh                       # git helper

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

# FZF KEYBINDINGS
[ -f $CONFIG_HOME/zsh/.fzf.zsh ] && source $CONFIG_HOME/zsh/.fzf.zsh
export FZF_TMUX=1
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Shortcut to gitignore.io API
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

alias luamake=/Users/jdsee/.config/nvim/lua-language-server/3rd/luamake/luamake

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

