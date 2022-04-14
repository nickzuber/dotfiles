### Shortcuts and Alisas
alias p='cd ~/projects'
alias h='cd ~'

# Git
alias gpp="git push origin HEAD"
alias br="git reflog |\
  grep checkout |\
  grep -o -E 'to (.*)' |\
  sed -e 's/to/  /' |\
  sed -e '1s/   / ∗ /' |\
  sed -e '1s/^/git branch history:\'$'\n/' |\
  sed -e '1s/$/\'$'\n/' |\
  less"

### Toggle hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles Yes; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles No; killall Finder /System/Library/CoreServices/Finder.app'

### Reload the shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"

source ~/.bash_profile

# ZSH Config
export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="zuber-af-magic"

plugins=(
  git
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
