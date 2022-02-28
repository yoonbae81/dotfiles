" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General Override of Defaults
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible
set ttyfast
set showmode
set showcmd
set title
set number
set hidden
set lazyredraw
set mouse=a

" This is what files look like
set ffs=unix,dos,mac

" Update find path to search subdirectories
set path=$PWD/**

" Encoding
set encoding=utf-8
set fileencodings=utf-8,cp949,default,latin1
set termencoding=utf-8

" Clipboard
set clipboard=unnamedplus

" No backups
set nobackup
set noswapfile
set nowritebackup
set nowb

" Search
set hlsearch
set incsearch
set nowrapscan
set showmatch

" Line numbers
set number relativenumber
set nu rnu
set numberwidth=6

" File Handling
set autoread
set autowrite

" Keep lots of history/undo
set undolevels=1000

" Files to ignore
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
set wildignore+=*.beam
set wildignore+=*.swp,~*
set wildignore+=*.zip,*.tar

" Tab and Indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set cindent
set smartindent

" Folding
set foldmethod=indent
set foldlevel=99"
nnoremap <space> za

" Different tab/space stops
autocmd Filetype py setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

" Column limit
set colorcolumn=80,100
highlight ColorColumn ctermbg=238 guibg=#232728

" No visual bells
set novisualbell
set vb t_vb=

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Escape from input mode
inoremap jk <Esc>

" Save
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>
vnoremap <C-S> <ESC>:w<CR>

" Split
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Timestamp
nmap <F2> i<C-R>=strftime("%Y-%m-%d %I:%M")<CR><Esc>
imap <F2> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>
nmap <F3> i<C-R>=strftime("%Y%m%d%I%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y%m%d%I%M")<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Installation
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Set up Vundle on first install - Vundle, in turn, installs all other plugins
set exrc
set secure

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'


" Colorscheme
Plugin 'jnurmine/Zenburn'
colorscheme zenburn

" Airline
Plugin 'vim-airline/vim-airline'

" ALE Configuration
" Plugin 'dense-analysis/ale'
" let g:ale_fixers = {
" \    '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'css': ['prettier'],
" \   'javascript': ['prettier', 'eslint'],
" \   'json': ['prettier'],
" \   'less': ['prettier'],
" \   'python': ['black', 'isort'],
" \   'scss': ['prettier'],
" \   'yaml': ['prettier'],
" \}
" let g:ale_linters = {
" \   'css': ['prettier'],
" \   'javascript': ['prettier', 'eslint'],
" \   'json': ['prettier'],
" \   'less': ['prettier'],
" \   'python': ['flake8'],
" \   'scss': ['prettier'],
" \   'yaml': ['prettier'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
" let g:ale_python_pylint_options = '-j 0 --max-line-length=120'

" NERDTree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeWinSize=18
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Python Syntax
" Plugin 'vim-python/python-syntax'
" let g:python_highlight_all = 1

" Python Launcher
autocmd FileType python  map <buffer> <F1>      :w<CR>:term python3 %<CR>:startinsert<CR>
autocmd FileType python imap <buffer> <F1> <esc>:w<CR>:term python3 %<CR>:startinsert<CR>

" autocmd FileType python map <buffer> <F1> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
" autocmd FileType python imap <buffer> <F1> <esc>:w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>

" Python Call Signature
" Plugin 'davidhalter/jedi-vim'
" let g:jedi#auto_initialization = 1
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command = ""
" let g:jedi#show_call_signatures = 1

" Python Auto-completion
" Plugin 'roxma/nvim-yarp'
" Plugin 'ncm2/ncm2'
" Plugin 'ncm2/ncm2-bufword'
" Plugin 'ncm2/ncm2-path'
" Plugin 'HansPinckaers/ncm2-jedi'

" ncm2 settings
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=menuone,noselect,noinsert
" set shortmess+=c
" inoremap <c-c> <ESC>
" let ncm2#popup_delay = 5
" let ncm2#complete_length = [[1, 1]]
" let g:ncm2#matcher = 'substrfuzzy'


" List bundles here
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-cucumber'

" Markdown support
" https://github.com/preservim/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
