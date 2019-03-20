" vim-plugs
call plug#begin('~/.config/nvim/plugged')
" Dark theme
Plug 'joshdick/onedark.vim'
" GitGutter
Plug 'airblade/vim-gitgutter'
" Python Highlighting
Plug 'numirias/semshi'

Plug 'zenbro/mirror.vim'
" Golang
Plug 'fatih/vim-go'
" Code completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Golang Autocompletion
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Status/Tabline
Plug 'vim-airline/vim-airline'
" Tabline Theme
Plug 'vim-airline/vim-airline-themes'
" Ansible
Plug 'pearofducks/ansible-vim'
" Display indentation lines
Plug 'Yggdroot/indentLine'
" Vim TMUX
Plug 'christoomey/vim-tmux-navigator'

"Plug 'mileszs/ack.vim'
" Autocomplete delimiters
Plug 'Raimondi/delimitMate'
" Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'
" Snippets
Plug 'SirVer/ultisnips'

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

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Source .zshrc on exit if it was modified
autocmd BufWritePost ~/.zshrc :!source ~/.zshrc
" Source vimrc
autocmd BufWritePost ~/$MYVIMRC source %<CR>

" Ansible/Yaml specific
autocmd Filetype yaml setlocal et ts=2 ai sw=2 nu sts=0

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

