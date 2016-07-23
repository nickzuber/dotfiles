## Requirements

Some programs you're going to already need to have in preparation. Just skip any of these steps that you already have done -- all of these steps are assuming you're on a pretty fresh machine.

### Install Homebrew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install ZSH
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install Ruby & Python

```
$ brew install ruby
$ brew install python
```

### Install TMUX

We need to install `autogen` before we install TMUX, and afterwards we're going to want to install the plugin manager `tpm`.

```
$ brew install autogen
$ git clone https://github.com/tmux/tmux.git
$ cd tmux
$ sh autogen.sh
$ ./configure && make
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install Vundle

`Vundle` is our plugin manager for `VIM`.

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install Powerline

We need to do a few things here -- first install Powerline itself, and then its fonts.

```
pip install powerline-status
$ git clone git@github.com:powerline/fonts.git
$ cd fonts
$ ./install.sh
```

## Install Dotfiles

```
$ git clone git@github.com:nickzuber/dotfiles.git
$ cd dotfiles
$ ./install.sh
```
