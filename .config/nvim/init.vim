" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

" Initialize plugin system
call plug#end()

" Swapfile and undos
set noswapfile
set nobackup
set nowritebackup

" Persistent undos
if !&diff
  set undodir=~/.vim/undodir
  set undofile
endif

" The good old whitespaces
set list listchars=tab:▸\ ,eol:\ ,trail:·
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Preferences
set number
set relativenumber
set ruler
set showmode
set noerrorbells
set hlsearch
set hidden
:filetype on
set spell spelllang=en_ca

set clipboard=unnamedplus

" Generic Hotkeys
let mapleader = "\<Space>"

noremap <Leader>ve :vsplit $MYVIMRC<CR>
noremap <Leader>vs :source $MYVIMRC<CR>
noremap ; :
nnoremap Q @q
nnoremap <Leader>n :set hlsearch!<CR>
noremap <C-p> :FZF<CR>
noremap <Leader>gg :grep -rn --exclude={tags,.php_cs.cache} --exclude-dir={vendor,.git,.phpcd} 
noremap <Leader>fa :grep -rn --exclude={tags,.php_cs.cache} --exclude-dir={vendor,.git,.phpcd} <cword> ./

" Scroll faster!
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" Window navigation
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Exit terminal
:noremap <Esc> <C-\><C-n>

" Expand current path
noremap <Leader>p :put=expand('%:p')<CR>

" Plugins config

" Use Airline as the tab manager
let g:airline#extensions#tabline#enabled = 1

" Color scheme
set termguicolors
let g:airline_theme='base16_gruvbox_dark_hard'
colorscheme gruvbox-baby
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" Hack to get netrw to close the buffer when we pick a file
" ref: https://github.com/tpope/vim-vinegar/issues/13#issuecomment-315584214
set nohidden
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

" fzf
nnoremap <Leader>f :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

