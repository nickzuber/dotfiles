### Shortcuts and Alisas
alias p='cd ~/projects'
alias h='cd ~'

# Temp aliases
alias infrared='./bin/infrared.exe'

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

export REACT_EDITOR=code

source ~/functions.zsh
source ~/.bash_profile

# ZSH Config
export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="zuber"

plugins=(
  git
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
fpath=(~/functions.zsh "${fpath[@]}")

export NVM_DIR="/Users/nick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use stable

# export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="/Users/nick/.opam/system/share/merlin/vim/plugin/merlin.vim:$PATH"
export PATH="/Users/nick/.opam/system/bin/ocamlmerlin:$PATH"

# OPAM configuration
. /Users/nick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
source /Users/nick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(pyenv init -)"
