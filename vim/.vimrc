" .VIMRC
" --------------------------------------------------------------------------------

" GENERAL
syntax on
set number
set relativenumber
set ignorecase              " case insensitive matching

" TABS AND SPACES
set backspace=2
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
set wildmode=longest,list   " get bash-like tab completions

" BUFFERS
set hidden                  " hide buffers without saving

" CODE
set showmatch               " show matching brackets

"KEY-MAPPINGS
let mapleader = "\<Space>"

nnoremap <nowait><silent> <C-C> :noh<CR>            " delete selection
vnoremap <A-j> :m '>+1<CR>gv=gv                     " mv line up [normal/insert]
nnoremap <A-j> :m .+1<CR>==                         " mv line down [normal/insert]
vnoremap <A-k> :m '<-2<CR>gv=gv                     " mv line down [normal/insert]
nnoremap <A-k> :m .-2<CR>==                         " mv line down [normal/insert]
inoremap <A-j> <Esc>:m .+1<CR>==gi                  " mv line up [visual]
inoremap <A-k> <Esc>:m .-2<CR>==gi                  " mv line up [visual]

" NAVIGATION
noremap j gj
noremap k gk
noremap <Leader>e $           " jump to end of line
noremap <C-S-J> <C-W>j        " go window down
noremap <C-S-K> <C-W>k        " go window up
noremap <C-S-H> <C-W>h        " go window left
noremap <C-S-L> <C-W>l        " go window right
noremap <C-S-W> <C-W>q        " close window
noremap <C-C-I>               " next buffer

" CLIPBOARD
noremap <Leader>y "*y
noremap <Leader>p "*p


