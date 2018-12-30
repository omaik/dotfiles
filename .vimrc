set nocompatible              " be iMproved, required
set showcmd
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
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




let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

call vundle#end()
let mapleader = "\<Space>"
" normal mode mappings
nmap 0 ^
nmap <leader>vr :vs $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>zsh :vs ~/.zshrc<cr>

nmap <leader>r /def\s
" unmap arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


autocmd BufWritePre * :%s/\s\+$//e


" insertion mode mappings
imap <C-s> <esc>:w<cr>
imap jk <esc>
imap kj <esc>
