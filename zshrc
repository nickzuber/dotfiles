### Shortcuts and Alisas
alias p='cd ~/projects'
alias h='cd ~'
alias nz='cd ~/projects/nickzuber.com/'
alias markup='ssh root@192.241.154.169'  # oops all my shit is on root
alias xcode-themes='open ~/Library/Developer/Xcode/UserData/FontAndColorThemes'
alias os='ssh nzuber@mercury.cs.uml.edu'
alias octave-cli='/usr/local/octave/3.8.0/bin/octave-3.8.0 ; exit;'
alias ml='cd ~/Desktop/School/Senior\ \|\ Fall/MachineLearning/'
alias matlab='/Applications/MATLAB_R2017b.app/bin/matlab'

### Toggle hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles Yes; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles No; killall Finder /System/Library/CoreServices/Finder.app'

### Reload the shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"

export REACT_EDITOR=code

source ~/functions.zsh
source ~/.bash_profile
tmux source ~/.tmux.conf

# ZSH Config
export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="zuber-af-magic"

plugins=(
  git
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
fpath=(~/functions.zsh "${fpath[@]}")

export NVM_DIR="/Users/nick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# HyperTerm.app runs `bash -ilc env` in an attempt to find npm
# if [[ "$(ps -o command= $$)" =~ bash\ -ilc\ env &&
#       "$(ps -o command= $PPID)" =~ HyperTerm\.app ]]; then
#   nvm use stable
# fi

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/Users/nick/.opam/system/share/merlin/vim/plugin/merlin.vim:$PATH"
export PATH="/Users/nick/.opam/system/bin/ocamlmerlin:$PATH"

# OPAM configuration
. /Users/nick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
source /Users/nick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(pyenv init -)"

