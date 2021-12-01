# KITTY
alias icat="kitty +kitten icat"

# PYTHON
alias py="ptpython --vi"

# VIM
alias nvim=/usr/local/nvim-osx64/bin/nvim               # TODO: swap as soon brew released 0.6
alias v=nvim

# GIT
alias lg=lazygit
alias rmgi="git rm -r --cached . && git add . && git status"

# GENERAL
alias _=sudo
alias cat=bat
alias grep="grep --color"
alias hgrep="history 0 | grep"
alias help="man"
alias rm="rm -i"                                        # confirm deletion
alias mycolors="msgcat --color=test"

# SOURCE
alias src.zsh="source $HOME/.zshrc"
alias src.aliases="source $HOME/.config/zsh/aliases.zsh"

# CONFIUGRE
alias set.zsh="nvim $HOME/.zshrc"
alias set.env="nvim $HOME/.zshenv"
alias set.aliases="nvim $HOME/.config/zsh/aliases.zsh"
alias set.completion="nvim $HOME/.config/zsh/completion.zsh"
alias set.nvim="nvim $HOME/.config/nvim/init.lua"
alias set.kitty="nvim $HOME/.config/kitty/kitty.conf"

# SHORTCUTS
alias go.home="cd"
alias go.config="cd $HOME/.config"
alias go.dots="cd $HOME/dotfiles"
alias go.code="cd $HOME/code"

# NAVIGATION
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias ls=lsd
alias ll="ls -Alh"
alias la="ls -A"
alias ld="ls -Ad"
alias tree="la --tree"
alias trees="tree --depth 4"

