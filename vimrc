"" PLUGINS
" activates filetype detection
filetype plugin indent on
""" Packages
call plug#begin('~/.vim/plugged')
" colorscheme
Plug 'morhetz/gruvbox'
" saving sessions and startup menu
Plug 'mhinz/vim-startify'
" nice undo tree
Plug 'simnalamburt/vim-mundo'
" completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" language specific plugis
" elm
Plug 'elmcast/elm-vim'
" python
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'vim-scripts/indentpython.vim'
call plug#end()
""" Settings
" Mundo
let g:mundo_preview_bottom = 1
let g:mundo_playback_delay = 300
let g:mundo_close_on_revert = 1
set undofile
set undodir=~/.vim/undo

source ~/.vim/cocvimrc

" Specifiy a color scheme.
try 
  colorscheme gruvbox
  let g:gruvbox_contrast_dark = 'hard'
catch
  colorscheme desert
endtry

"" BASIC SETTINGS
" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start
if has('unnamedplus')
set clipboard=unnamedplus
endif


"" MY SETTINGS
""" All

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Reload files automatically when changed on disk
set autoread

" Allow per project .vimrc files
set exrc

" Save 1,000 items in history
set history=1000

" Show the line and column number of the cursor position
set ruler

" Display the incomplete commands in the bottom right-hand side of your screen.  
set showcmd

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

" Highlight search matches
set hlsearch

" Enable incremental searching
set incsearch

" Turn on line numbering
set number

" Don't line wrap mid-word.
set lbr

" Copy the indentation from the current line.
set autoindent

" Enable smart autoindenting.
set smartindent

" Use spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" Make a tab equal to 4 spaces
set shiftwidth=2
set tabstop=2


" Tell vim what background you are using
" set bg=light
set bg=dark

" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
map Y y$
""" Usused

" Ignore case when searching
"set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
"set smartcase

" Remap VIM 0 to first non-blank character
" map 0 ^

" Turn on file backups
"set backup

"" MAPPINGS
nmap <leader>v :e $MYVIMRC<CR>

" change the mapleader from \ to ,
" NOTE: This has to be set before <leader> is used.
map <Space> <LocalLeader>
" Quickly save your file.
imap jk <ESC>  
map <leader>] :bn<CR>
map <leader>[ :bp<CR>
map <leader>u :MundoToggle<CR>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nmap <TAB> za

"" FILE SETTINGS (should be moved to ftplugin)
" Python settings
" setlocal means that the settings will apply only to the current buffer
" and do not override already open ones
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4
    \ | setlocal softtabstop=4
    \ | setlocal shiftwidth=4
"   \ | setlocal textwidth=79
    \ | setlocal expandtab
    \ | setlocal autoindent
    \ | setlocal fileformat=unix

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim-plug plugin management autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

