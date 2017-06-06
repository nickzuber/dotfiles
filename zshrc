### Shortcuts and Alisas
alias p='cd ~/projects'
alias h='cd ~'
alias blog='cd ~/projects/ssg-nickzuber.com/src/_posts'
alias ssh-website='ssh root@192.241.154.169'
alias xcode-themes='open ~/Library/Developer/Xcode/UserData/FontAndColorThemes'
alias opl='cd ~/Desktop/Junior\ Year/OPL/'
alias os='ssh nzuber@mercury.cs.uml.edu'

### Toggle hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles Yes; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles No; killall Finder /System/Library/CoreServices/Finder.app'

### Reload the shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"

source ~/functions.zsh
source ~/.bash_profile
tmux source ~/.tmux.conf

### ZSH Config

export ZSH=/Users/nick/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh

### Custom zsh functions
fpath=(~/functions.zsh "${fpath[@]}")

### Run custom window prompt
# node ~/prompt/prompt.js

### Launch tmux
if [[ ! $TERM =~ screen  ]]; then
	exec tmux
fi

export NVM_DIR="/Users/nick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"

### OPAM configuration
. /Users/nick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
