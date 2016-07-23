#!/bin/bash

#DEV_MODE='true'
now=$(date +"%T")

if [[ ! -z "$DEV_MODE" ]]; then
  echo "[$now] Running in development mode..."
  if [[ ! -d $HOME/_dotfiles_testing ]]; then
    echo "[$now] Creating development directory..."
    mkdir $HOME/_dotfiles_testing
  else
    echo "[$now] Development directory already exists, continuing without errors."
  fi
  ROOT=$HOME/_dotfiles_testing
else
  ROOT=$HOME
fi

OLD_DOTFILES=$ROOT/old_dotfiles
DOTFILES=$ROOT/dotfiles


FILES=(
  'tmux.config'
  'vimrc'
  'zshrc'
)

# Stop at errors
set -e

echo "[$now] Changing directory to $ROOT and about to install files..."
cd $ROOT

if [[ ! -d $DOTFILES ]]; then
  echo "[$now] Unable to resolve $DOTFILES -- this directory must exist."
  echo "[$now] Aborting installation process."
  exit 0
fi

function symlink() {
  local source=$1
  local dest=$2

  echo "[$now] Linking $source to $dest..."

  if [ -e $dest ]; then
    echo "[$now] $dest already exists, moving to $OLD_DOTFILES before process continues."
    if [[ ! -d $OLD_DOTFILES ]]; then
      mkdir $OLD_DOTFILES
    fi
    mv $dest "$OLD_DOTFILES/$dest"
  fi
  mv $source $dest

  echo "[$now] Succesfully linked $dest!"
}

for file in "${FILES[@]}"; do
  baseName=$(basename "$file")
  symlink $DOTFILES/$file $ROOT/.$baseName
done

