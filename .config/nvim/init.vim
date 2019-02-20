" vim-plugs
call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'numirias/semshi'
Plug 'zenbro/mirror.vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pearofducks/ansible-vim'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
call plug#end()

" OneDark configuration
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	set termguicolors
endif

let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

syntax on
colorscheme onedark

let g:onedark_hide_endofbuffer=1
let g:airline_theme='onedark'

let mapleader = ","         " Use , instead of \

" Enable syntax
syntax enable

filetype indent on 	    " Load indent files
filetype plugin on          " Enable filetype plugins

set softtabstop=4           " 4 space tabs
set shiftwidth=4            " 4 space tabs
set expandtab               " Spaces instead of tab
set cursorline 		    " highlight current line
set wildmenu		    " Visual autocomplete for command menu
set wildmode=list:longest   
set lazyredraw		    " Redraw only when necessary
set encoding=utf-8          " Default encoding
set scrolloff=10            " Min number of lines visible over/under active line
set autoindent              " Auto indent next line
set showmode
set hidden
set showcmd 		    " show command in bottom bar
set visualbell              " beeps annoy me
set backspace=indent,eol,start
set relativenumber          " Show relative line number
set ignorecase              " Search - Ignore case by default
set smartcase               " Case sensitive if any upper case chars in search
set gdefault                " global search by default (for line)
set showmatch		    " Highlight matching brackets
set incsearch               " Incremental search
set hlsearch                " Highlight search by default
set foldenable              " Enable code folding
set foldmethod=indent       " Fold on indent
set foldlevelstart=10
set foldnestmax=10
set autochdir               " Chdir based on filename
set copyindent              " Copy indentation from previous line
set confirm                 " Use dialog to confirm
set ruler                   " Show Column
set nowrapscan              " Fix long line cursor control
set laststatus=2            " Always show status line
set shell=/usr/bin/zsh      " Manually set shell
inoremap jj <ESC>           " Remap esc
nnoremap <space> za         " Un/Fold code
" Clear highlight with ,<space>
nnoremap <leader><space> :noh<cr> 
nnoremap <tab> %            " Tab to opposite brackets
vnoremap <tab> %            " Tab to opposite brackets

" Map F1 to escape to avoid accidentally opening help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <C-h> <C-w>h       " Better window handling
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle nerd comments with Ctrl+/
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" Toggle cursorbind between 2 windows
nnoremap <F12> :set crb!<CR><C-w><C-w>:set crb!<CR>

" Edit vimrc
nnoremap <C-Shift-`> :edit ~/.vimrc<CR>

" Toggle Nerdtree
map <C-n> :NERDTreeToggle<CR>
" Open nerdtree on startup if no file or directory provided 
autocmd StdinReadPre * let s:std_in=1 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open Nerdtree when if I close last open window
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Source .zshrc on exit if it was modified
autocmd VimLeavePre .zshrc :!source ~/.zshrc
" Source vimrc
autocmd VimLeavePre .vimrc :!so %<CR>

" Ansible/Yaml specific
autocmd Filetype yaml setlocal et ts=2 ai sw=2 nu sts=0

let g:ackprg = 'ag --nogroup --nocolor --column'

