set nocompatible              " be iMproved, required
set showcmd                   " shows command while typing it
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smartindent
set autoindent
set scrolloff=4 " mininum lines on screen below or above the cursor
set noswapfile
set ignorecase
set smartcase
set incsearch
set nojoinspaces
set hls
set laststatus=2
set statusline=%!getcwd()
set relativenumber
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
syntax on

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails' "rails stuff
Plugin 'ctrlpvim/ctrlp.vim' "search files
Plugin 'nanotech/jellybeans.vim' "colorscheme
Plugin 'vim-ruby/vim-ruby' "ruby stuff
Plugin 'tpope/vim-commentary' "easy commenting
Plugin 'tpope/vim-fugitive' "git
Plugin 'scrooloose/nerdtree' "sidebar
Plugin 'FelikZ/ctrlp-py-matcher' "higher speed of ctrl+p
Plugin 'mileszs/ack.vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-unimpaired'
Plugin 'chiel92/vim-autoformat'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'wikitopian/hardmode'
call vundle#end()
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ackprg = "ag --vimgrep"
let g:ctrlp_use_caching = 0

filetype plugin indent on
colorscheme jellybeans
hi Comment cterm=italic
let mapleader = "\<Space>"
runtime macros/matchit.vim
" normal mode mappings
" copy path of current file
nmap cp :let @+ = expand("%")<cr>
" use 0 for going to text beggining
nmap 0 ^

" all leader mappings
" files openining
nmap <leader>vr :vs $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>zsh :vs ~/.zshrc<cr>
" tags related staff
" nmap <leader>n :tn<cr>
" nmap <leader>t :tag<space>
nnoremap <leader>. :CtrlPTag<cr>
"searching
nmap <leader>f :Ack<space>
nmap <leader>fbp :Ack<space>binding.pry<CR>
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
map <Leader>w <C-w>w
" coding aliases
nmap <leader>bp obinding.pry<esc>:w<cr>
nmap <leader>dd :%d<cr>
"fast tabs with projects
nmap <leader>oca :tabnew<cr>:lcd ~/work/core-api<cr>
nmap <leader>omr :tabnew<cr>:lcd ~/work/onelogin.com<cr>
nmap <leader>tcd :tabnew<cr>:lcd ~/work/
" insert and delete empty lines
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" this is Option+J and Option+K mappings
nnoremap ∆ :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap ˚ :set paste<CR>m`O<Esc>``:set nopaste<CR>
" Swap selected lines
nnoremap Ô :m .+1<CR>==
nnoremap  :m .-2<CR>==
inoremap Ô <Esc>:m .+1<CR>==gi
inoremap  <Esc>:m .-2<CR>==gi
vnoremap Ô :m '>+1<CR>gv=gv
vnoremap  :m '<-2<CR>gv=gv
" unmap arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"Easymotion
map \ <Plug>(easymotion-prefix)



map <C-n> :NERDTreeToggle<CR>

"autocommands
autocmd BufWritePre * :%s/\s\+$//e

" different cursors for different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Highlight the ruler of 80 symbols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" insertion mode mappings
imap <C-s> <esc>:w<cr>
imap jk <esc>
imap kj <esc>
imap jj <esc>
imap kk <esc>
imap <C-a> <home>
imap <C-e> <end>


" Clipboard support for delete and yank
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
" Commands
command! Q qall
command! Tag !ctags -R --exclude=node_modules --exclude=docker --exclude=reports
