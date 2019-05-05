set nocompatible                " be iMproved, required
set showcmd                     " shows command while typing it
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
set number
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
syntax on
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails' "rails stuff
" Plugin 'ctrlpvim/ctrlp.vim' "search files
" Plugin 'FelikZ/ctrlp-py-matcher' "higher speed of ctrl+p
Plugin 'nanotech/jellybeans.vim' "colorscheme
Plugin 'vim-ruby/vim-ruby' "ruby stuff
Plugin 'tpope/vim-commentary' "easy commenting
Plugin 'tpope/vim-fugitive' "git
Plugin 'scrooloose/nerdtree' "sidebar
" Plugin 'mileszs/ack.vim' "search all files
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround' "magic
Plugin 'tpope/vim-repeat' " ultra magic
Plugin 'Townk/vim-autoclose' " autoclose of quotes etc.
Plugin 'tpope/vim-unimpaired'
Plugin 'chiel92/vim-autoformat'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab' "autocomplete with tab
Plugin 'wikitopian/hardmode' "prevents clicking the same key twice
Plugin 'airblade/vim-matchquote' "matches and begging of quote
Plugin 'vim-airline/vim-airline' " statusbar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim' " theme
Plugin 'godlygeek/tabular' " great allignment
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
" GO
" Plugin 'fatih/vim-go'
call vundle#end()
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:SuperTabDefaultCompletionType = "context"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ackprg = "ag --vimgrep"
let g:ctrlp_use_caching = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:airline#extensions#tabline#tabs_label = fnamemodify(getcwd(), ':t')
filetype plugin indent on
" colorscheme jellybeans
set background=dark
colorscheme onedark
hi Comment cterm=italic
let mapleader = "\<Space>"
runtime macros/matchit.vim
" normal mode mappings
" copy path of current file
nmap cp :let @+ = expand("%")<cr>
nmap gst :Gstatus<cr>
" use 0 for going to text beggining
nmap 0 ^

" ZFZ mappings
nmap <C-p> :GFiles<cr>
nmap <leader>P :Files<cr>
nmap <D-r> :BTags<cr>
nmap <C-f> :Ag<space>
nmap <C-f>bp :Ag<space>binding.pry<CR>


nmap <Leader>: :History:<CR>
nmap <leader>/ :History/<cr>

let g:fzf_layout = { 'down': '~13%' }

" open terminal
nmap <leader>t :term<cr>
"show changes diff
nmap <leader>diff :w !diff % -<cr>
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
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
map <Leader>w <C-w>w
" coding aliases
nmap <leader>bp obinding.pry<esc>:w<cr>
nmap <leader>dd :%d<cr>
"fast tabs with projects
nmap <leader>oca :tabnew<cr>:lcd ~/work/core-api<cr>
nmap <leader>omr :tabnew<cr>:lcd ~/work/onelogin.com<cr>
nmap <leader>tcd :tabnew<cr>:lcd ~/work/
" open current file in sidebar
nmap <leader>n :NERDTreeFind<cr>
" clears last search highlight
nmap <leader>c :noh<cr>

" indent the lines using Command+[]
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

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
imap jj <esc>
imap <C-a> <home>
imap <C-e> <end>


" Clipboard support for delete and yank
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Source vimrc automatically on save
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif
" Commands
command! Q qall
command! Tag !ctags -R --exclude=node_modules --exclude=docker --exclude=reports

function! Expand_commit_template()
  let branch_name = matchstr(system('git rev-parse --abbrev-ref HEAD'), '\p\+')
  call setline(1, branch_name . ': ')
  call feedkeys('A')
endfunction


autocmd BufRead */.git/COMMIT_EDITMSG call Expand_commit_template()
