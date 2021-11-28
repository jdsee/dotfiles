# ---------------------------------------------------------------------------------
# ZSH - CONFIG
# ---------------------------------------------------------------------------------

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/config}
# SOURCES
source "${ZINIT_HOME}/zinit.zsh"          # docs: https://zdharma-continuum.github.io/zinit/wiki/
source $CONFIG_HOME/zsh/aliases.zsh
source $CONFIG_HOME/zsh/completion.zsh
source $CONFIG_HOME/zsh/functions.zsh

export GPG_TTY=$(tty)                     # required by gpg-agent
# OPTIONS
setopt HIST_IGNORE_ALL_DUPS               # ignore history duplicates

# PYTHON
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ZOXIDE
eval "$(zoxide init zsh --cmd j)"

# PLUGINS
zinit ice wait'!0'
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'   # pure theme
zinit light sindresorhus/pure                                       # "
zinit light zsh-users/zsh-syntax-highlighting                       # syntax highlighting
zinit light Aloxaf/fzf-tab                                          # tab completion with fzf
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

autoload -U colors && colors
RPROMPT='$(check_last_exit_code)'

# ZSH KEY-BINDINGS
bindkey '^K'                      up-line-or-search up-line-or-select history-beginning-search-backward
bindkey '^J'                      down-line-or-search down-line-or-select history-beginning-search-forward
bindkey '^[[108;6u'               autosuggest-accept

# FZF KEYBINDINGS
[ -f $CONFIG_HOME/zsh/.fzf.zsh ] && source $CONFIG_HOME/zsh/.fzf.zsh

