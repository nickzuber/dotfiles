# Shortcuts and Alisas

alias p='cd ~/projects'
alias h='cd ~'
alias blog='cd ~/projects/ssg-nickzuber.com/src/_posts'
alias ssh-site='ssh root@192.241.154.169'

# toggle hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles Yes; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles No; killall Finder /System/Library/CoreServices/Finder.app'

# reload the shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"

source ~/functions.zsh
tmux source ~/.tmux.conf

# ZSH Config

export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Custom zsh functions
fpath=(~/functions.zsh "${fpath[@]}")

# Run custom window prompt

sh ~/prompt.sh

