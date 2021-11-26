# ---------------------------------------------------------------------------------
# ZSH - CONFIG
# ---------------------------------------------------------------------------------

# SOURCES
source "${ZINIT_HOME}/zinit.zsh"          # docs: https://zdharma-continuum.github.io/zinit/wiki/
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/completion.zsh

# OPTIONS
setopt HIST_IGNORE_ALL_DUPS               # ignore history duplicates

# CASE INSENSITIVE MATCHING
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# PYTHON
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# PLUGINS
zinit ice wait'!0'
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'   # pure theme
zinit light sindresorhus/pure                                       # "
zinit light zsh-users/zsh-syntax-highlighting                       # syntax highlighting
zinit light zsh-users/zsh-autosuggestions                           # autosuggestions
zinit light ajeetdsouza/zoxide                                      # autojump
zinit snippet OMZ::plugins/git/git.plugin.zsh                       # git helper

# PURE
PURE_PROMPT_SYMBOL=𝚲
PURE_NODE_ENABLED=0
PURE_CMD_MAX_EXEC_TIME=0

zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:execution_time color white
zstyle :prompt:pure:prompt:success color white

# ZOXIDE
eval "$(zoxide init zsh --cmd j)"

# MKDIR -> CD
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}

# EXIT-CODE PROMPT
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}❗$LAST_EXIT_CODE%{$reset_color%}"
  fi
  echo $EXIT_CODE_PROMPT
}

autoload -U colors && colors
RPROMPT='$(check_last_exit_code)'

# ZSH KEY-BINDINGS
bindkey '^K'            up-line-or-search
bindkey '^K'            up-line-or-select
bindkey '^K'            history-beginning-search-backward
bindkey '^J'            down-line-or-search
bindkey '^J'            down-line-or-select
bindkey '^J'            history-beginning-search-forward

bindkey '^[[108;6u'     autosuggest-accept


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
