# KITTY
alias icat="kitty +kitten icat"

# PYTHON
alias py="ptpython --vi"

# VIM
alias v="nvim"
alias vi="nvim"
alias iv="floaterm"
alias vimception="floaterm"

# GIT
alias lg=lazygit
alias rmgi="git rm -r --cached . && git add . && git status"
alias conflicts="grep -lr '<<<<<<<' ."

# GENERAL
alias _="sudo"
alias cat="bat -p"
alias grep="grep --color"
alias hgrep="history 0 | grep"
alias help="man"
alias mycolors="msgcat --color=test"
alias view="zathura"
alias diff="colordiff"
alias kb=setxkbmap
alias clip="xclip -sel clip"

# DEVICES
# TODO: add bluetooth helper here

# SOURCE
alias src.zsh="source $HOME/.zshrc"
alias src.aliases="source $HOME/.config/zsh/aliases.zsh"

# CONFIUGRE
alias set.zsh="nvim $HOME/.zshrc"
alias set.env="nvim $HOME/.zshenv"
alias set.aliases="nvim $HOME/.config/zsh/aliases.zsh"
alias set.functions="nvim $HOME/.config/zsh/functions.zsh"
alias set.completion="nvim $HOME/.config/zsh/completion.zsh"
alias set.nvim="nvim $HOME/.config/nvim/init.lua"
alias set.kitty="nvim $HOME/.config/kitty/kitty.conf"

# SHORTCUTS
alias go.home="cd"
alias go.conf="cd $HOME/.config"
alias go.dots="cd $HOME/dotfiles"
alias go.code="cd $HOME/code"

# NAVIGATION
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias ls="lsd"
alias ll="ls -Alh"
alias la="ls -A"
alias ld="ls -Ad"
alias tree="la --tree"
alias trees="tree --depth 4"

# TMUX
# restore session after reboot
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

