# -----------------------------------------------------------------------------------------------------
# ZSH - COMPLETIONS
# -----------------------------------------------------------------------------------------------------

# Should be called before compinit
zmodload zsh/complist

bindkey -M menuselect '^H' vi-backward-char
bindkey -M menuselect '^K' vi-up-line-or-history
bindkey -M menuselect '^J' vi-down-line-or-history
bindkey -M menuselect '^L' vi-forward-char

bindkey -M menuselect '^G' clear-screen
bindkey -M menuselect '^I' vi-insert
bindkey -M menuselect '^F' accept-and-infer-next-history
bindkey -M menuselect '^U' undo

bindkey '^[[Z' reverse-menu-complete    # activate shift-tab for cycling back

autoload -Uz compinit && compinit

# OPTIONS
# -----------------
setopt ALWAYS_TO_END                    # place cursor to end after completion
setopt LIST_PACKED                      # minimize occupied space of completion menu
setopt MENU_COMPLETE                    # highlight first element of completion menu
setopt AUTO_LIST                        # list choices on ambiguous completion.
setopt COMPLETE_IN_WORD                 # complete from both ends of a word.
setopt GLOBDOTS                         # include dotfiles

# ZSTYLES
# -----------------
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

source $HOME/.config/zsh/homebrew-completion.zsh
source $HOME/.config/zsh/ssh-host-completion.zsh

