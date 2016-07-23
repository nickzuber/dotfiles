set nocompatible
set ma                                              " Allow NERDTree and others modify buffer

" Themes & Colours
set t_Co=256
syntax enable
set encoding=utf-8

" Disable annoying beep
set visualbell

" Vim UI
set number                                          " Show line numbers
set laststatus=2                                    " Always display the status line
set noshowmode                                      " Hide default mode indicator (powerline instead)

" Disable vim backups
set nobackup
set noswapfile

" Enable wildmenu
set wildmenu
set wildmode=list:longest,full

" Enable mouse
set ttyfast
"set mouse=a

" Repond to keys faster - fix for powerline
set timeoutlen=1000 ttimeoutlen=0

" Text Formatting
set tabstop=2                                        " A tab is 2 spaces
set expandtab                                        " Use spaces instead of tabs
set shiftwidth=2                                     " Number of spaces for autoindenting
set smartindent                                      " Smartly indent
set smarttab                                         " Smartly indent
set autoindent
set list listchars=tab:»·,trail:·,nbsp:·             " Display extra whitespace
filetype indent on                                   " Enable smart indents

""""""""""""""""
" PLUGINS
"""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/gmarik/Vundle.vim'       " Let Vundle manage itself
Plugin 'scrooloose/nerdtree'                        " Tree Display for file system
Plugin 'airblade/vim-gitgutter'                     " Git diff gutter
Plugin 'vim-scripts/FuzzyFinder'                    " Fuzzy find files
Plugin 'vim-airline/vim-airline'                    " Better status bar
Plugin 'vim-airline/vim-airline-themes'             " Status bar themes
Plugin 'jiangmiao/auto-pairs'                       " Automatically pair braces, etc
Plugin 'tpope/vim-fugitive'                         " Git support
Plugin 'tpope/vim-surround'                         " Surround selections with characters
Plugin 'pangloss/vim-javascript'                    " JS syntax and indent plugins
Plugin 'scrooloose/syntastic'                       " Syntax helpers
Plugin 'ternjs/tern_for_vim'                        " Support for Javascript autocomplete
Plugin 'evanmiller/nginx-vim-syntax'                " Syntax support from nginx configs
if v:version > 703
    Plugin 'valloric/youcompleteme'                   " Autocomplete support
    " IMPORTANT INSTALLATION NOTES
    " https://github.com/Valloric/YouCompleteMe#installation
    " cd ~/.vim/bundle/you-complete-me
    " ./install.py --tern-completer
endif
" Plugin 'valloric/youcompleteme'
call vundle#end()
filetype on

"""""""""""""""""""
" KEYMAPS
"""""""""""""""""""

" Remap leader from \ to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Quick safe close
nnoremap <leader>q :q<CR>
" Quick force close
nnoremap <leader>Q :q!<CR>
" Quick save
nnoremap <leader>s :w<CR>
" Quick save & quit
nnoremap <leader>sq :wq<CR>


" Disable line deleting functions.
map K <Nop>
map J <Nop>
map s <Nop>

" Disable annoying unused keys
map Q <Nop>

"""""""""""""""
" Autocomplete
"""""""""""""""
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"""""""""""""""
" NERDTree
"""""""""""""""

" Map ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Use ASCII characters for directory arrows
let g:NERDTreeDirArrows=0

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""
" Searching
"""""""""""""""



" Searching
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"nnoremap <Esc><Esc> :nohlsearch<CR>

" Fuzzy searching
"map f/ <Plug>(incsearch-fuzzy-/)
"map f? <Plug>(incsearch-fuzzy-?)
"map fg/ <Plug>(incsearch-fuzzy-stay)



" Center matched search terms
map N Nzz
map n nzz

" Search selected text
vnoremap / "hy/<C-r>h"

"""""""""""""""
" Syntastic
"""""""""""""""

" Use eslint over jshint
let g:syntastic_javascript_checkers = ['eslint']

"""""""""""""""
" Airline
"""""""""""""""

let g:airline_theme='bubblegum'        " Sets the theme
let g:airline_powerline_fonts = 1      " Patches font for airline/Powerline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

