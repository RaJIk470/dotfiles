call plug#begin('~/.vim/plugged')
  Plug 'junegunn/goyo.vim'
  Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
  "Plug 'junegunn/limelight.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' } "Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'jiangmiao/auto-pairs'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'doums/darcula'
call plug#end()
syntax on
let mapleader=" "
set backupdir=/tmp
set directory=~/.vim/tmp,.
set backup
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set formatoptions-=cro

set splitbelow splitright

set undofile

set smartindent
set ignorecase
set smartcase
"set paste
set wrap
set textwidth=79
set formatoptions=qrn1
set ai

set incsearch

nnoremap <leader>nh :noh<CR>
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>t :below terminal<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

map j gj
map k gk
map Y y$

set clipboard=unnamedplus

" nnoremap <leader>y "+y
" nnoremap <leader>p "+p

map <leader>y "+y
map <leader>p "+p

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p")"

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


nnoremap <leader>x :%!xxd<CR> :set ft=xxd<CR>
nnoremap <leader>l :%!xxd -r<CR> :set ft=noxxd<CR>

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  "Limelight
endfunction
function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  hi! NonText ctermfg=bg guifg=bg
  
  "Limelight!
endfunction

ca wq :w<CR>:call Quit()<CR>
ca q! :call Quit()<CR>
ca q :call Quit()<CR>
function! Quit()
  if winnr('$') > 3
    Goyo
  endif
  quit!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

set bg=dark
colorscheme gruvbox

"set bg=dark
"colorscheme darcula
"set termguicolors

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

set noruler
set noshowmode
set noshowcmd

set relativenumber
set number

set laststatus=0
set shortmess=F

"hi! NonText ctermfg=bg guifg=bg
filetype plugin on

set path+=**

set wildmenu
