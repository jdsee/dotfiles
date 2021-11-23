#! /bin/bash

if ! command -v stow &> /dev/null
then
  echo "GNU Stow not installed"
  echo "If you use Homebrew, just run 'brew install stow'"
  echo "Otherwise find installation instructions here: https://github.com/aspiers/stow/blob/master/INSTALL.md"
  exit 1
fi

stow zsh
stow kitty
stow nvim
stow vim
stow git
stow lazygit
stow tmux

