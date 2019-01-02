set nocompatible              " be iMproved, required
set showcmd
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smartindent
set autoindent
set scrolloff=4
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set relativenumber
set number
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
syntax on
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomtom/tcomment_vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'majutsushi/tagbar'
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_use_caching = 0

call vundle#end()
filetype plugin indent on
set ruler
set tags=./tags
" colorscheme jellybeans
colorscheme space-vim-dark
hi Comment cterm=italic
let mapleader = "\<Space>"
" normal mode mappings
nmap 0 ^
nmap <leader>vr :vs $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>zsh :vs ~/.zshrc<cr>
" tags related staff
nmap <leader>n :tn<cr>
nmap <leader>f :tag<space>
nnoremap <leader>. :CtrlPTag<cr>
nmap <Leader>b :TagbarToggle<CR>
nmap <leader>r /def\s
" unmap arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

map <C-n> :NERDTreeToggle<CR>

autocmd BufWritePre * :%s/\s\+$//e
map <Leader>w <C-w>w
" methods traversing
nmap mm ]m
nmap MM [m

" insertion mode mappings
imap <C-s> <esc>:w<cr>
imap jk <esc>
imap kj <esc>
" coding aliases
nmap <leader>pp obinding.pry<esc>
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
