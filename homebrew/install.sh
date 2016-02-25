#!/usr/bin/env zsh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
source $DOTFILES_ROOT/functions/log
loglevel=$1

# Check for Homebrew
if ! [ -z "$(which brew)" ]
then
  info "Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi
else
  fail "Homebrew already installed."
fi

exit 0
