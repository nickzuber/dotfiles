# Shortcuts and Alisas

alias p='cd ~/projects'
alias h='cd ~'

# toggle hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles Yes; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles No; killall Finder /System/Library/CoreServices/Finder.app'

# reload the shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"


# ZSH Config

export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Custom zsh functions
fpath=(~/functions.zsh "${fpath[@]}")

