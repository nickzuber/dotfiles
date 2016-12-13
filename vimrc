set nocompatible

" Themes & Colours
set t_Co=256
syntax enable
set encoding=utf-8
scriptencoding utf-8

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
"set tabstop=2                                        " A tab is 2 spaces
"set expandtab                                        " Use spaces instead of tabs
"set shiftwidth=2                                     " Number of spaces for autoindenting
set tabstop=2
set shiftwidth=2
set softtabstop=0 noexpandtab
"set smarttab                                         " Smartly indent
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

" Vim color file
" Converted from Textmate theme Predawn using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
set cursorline
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "predawn"

" Set the colour of tab char with SpecialKey line ~226
" ctermfg is colour of characters
set list listchars=tab:›·

hi Cursor ctermfg=235 ctermbg=209 cterm=NONE guifg=#282828 guibg=#f18260 gui=NONE
hi Visual ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#4c4c4c gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3c3c gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3c3c gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3c3c gui=NONE
hi LineNr ctermfg=245 ctermbg=237 cterm=NONE guifg=#8d8d8d guibg=#3c3c3c gui=NONE
hi CursorLineNR ctermfg=245 ctermbg=237 cterm=NONE guifg=#ffffff guibg=#3c3c3c gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#626262 guibg=#626262 gui=NONE
hi MatchParen ctermfg=215 ctermbg=NONE cterm=underline guifg=#f49d62 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f1f1f1 guibg=#626262 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f1f1f1 guibg=#626262 gui=NONE
hi Pmenu ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#4c4c4c gui=NONE
hi IncSearch ctermfg=235 ctermbg=152 cterm=NONE guifg=#282828 guibg=#bddcdc gui=NONE
hi Search ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#626262 gui=NONE
hi Directory ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Folded ctermfg=243 ctermbg=235 cterm=NONE guifg=#777777 guibg=#282828 gui=NONE

hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#f1f1f1 guibg=#282828 gui=NONE
hi Boolean ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Character ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Comment ctermfg=243 ctermbg=NONE cterm=NONE guifg=#777777 guibg=NONE gui=NONE
hi Conditional ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi Constant ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Define ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f1f1f1 guibg=#46830d gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0808 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f1f1f1 guibg=#243958 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f1f1f1 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf5340 guibg=NONE gui=NONE
hi WarningMsg ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf5340 guibg=NONE gui=NONE
hi Float ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Function ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Keyword ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi Label ctermfg=152 ctermbg=NONE cterm=NONE guifg=#bddcdc guibg=NONE gui=NONE
hi NonText ctermfg=235 ctermbg=235 cterm=NONE guifg=#282828 guibg=#282828 gui=NONE
hi Number ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi Operator ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi PreProc ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f1f1f1 guibg=NONE gui=NONE
hi SpecialKey ctermfg=0 ctermbg=NONE cterm=NONE guifg=#bddcdc guibg=NONE gui=NONE
hi Statement ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi String ctermfg=152 ctermbg=NONE cterm=NONE guifg=#bddcdc guibg=NONE gui=NONE
hi Tag ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f1f1f1 guibg=NONE gui=bold
hi Todo ctermfg=243 ctermbg=NONE cterm=inverse,bold guifg=#777777 guibg=NONE gui=inverse,bold
hi Type ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyFunction ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi rubyConstant ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=152 ctermbg=NONE cterm=NONE guifg=#bddcdc guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyInclude ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyEscape ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi rubyControl ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyOperator ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyException ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=243 ctermbg=NONE cterm=NONE guifg=#777777 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi htmlTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b4d388 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b4d388 guibg=NONE gui=NONE
hi htmlTagName ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b4d388 guibg=NONE gui=NONE
hi htmlArg ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b4d388 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f18260 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi yamlAnchor ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi yamlAlias ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=152 ctermbg=NONE cterm=NONE guifg=#bddcdc guibg=NONE gui=NONE
hi cssURL ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#f49d62 guibg=NONE gui=NONE
hi cssColor ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi cssClassName ctermfg=109 ctermbg=NONE cterm=NONE guifg=#92bfbf guibg=NONE gui=NONE
hi cssValueLength ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ecec89 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b4d388 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi link NERDTreeDir Normal
hi link NERDTreeDirSlash Normal
