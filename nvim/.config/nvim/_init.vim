" | jdsee |
" |--------------------------------------------------------------------------------
" |  NEOVIM - INIT
" |--------------------------------------------------------------------------------

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

" STYLE
set termguicolors
" colorscheme gruvbox8

"KEY-MAPPINGS
let mapleader = "\<Space>"

nnoremap <nowait><silent> <C-C> :noh<CR>            " delete selection
vnoremap <A-j> :m '>+1<CR>gv=gv                     " mv line up [normal/insert] nnoremap <A-j> :m .+1<CR>==                         " mv line down [normal/insert]
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


" PLUGINS
call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'https://github.com/tpope/vim-surround'                    " Work with suroundings
  Plug 'https://github.com/preservim/nerdtree'                    " NerdTree
  Plug 'numToStr/Comment.nvim'                                    " Comment out with gcc, gc
  Plug 'nvim-lualine/lualine.nvim'                                " Statusline
  Plug 'norcalli/nvim-colorizer.lua'                              " Visualize color codes
  Plug 'https://github.com/jiangmiao/auto-pairs'                  " Generate auto bracket pairs
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Treesitter
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }  " Fuzzy search
  Plug 'kyazdani42/nvim-web-devicons'                             " Icons for Bufferline
  Plug 'romgrk/barbar.nvim'                                       " Bufferline
  Plug 'akinsho/toggleterm.nvim'                                  " Toggle Terminal
  Plug 'neovim/nvim-lspconfig'                                    " LSP cofnig
  Plug 'hrsh7th/cmp-nvim-lsp'                          
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

call plug#end()


" NERD-TREE
" ---------------------------------------------------------------------
let NERDTreeMapActivateNode='l'
nnoremap <A-1> :NERDTreeFocus<CR>                   " focus nerd-tree
nnoremap <C-n> :NERDTree<CR>                        " open nerd-tree
nnoremap <A-1> :NERDTreeToggle<CR>                  " toggle nerd-tree


" LUALINE
" ---------------------------------------------------------------------
lua require('lualine').setup { options = {theme = 'gruvbox'} }


" COMMENT
lua require('Comment').setup()


" BARBAR
" ---------------------------------------------------------------------
set termguicolors

" Move to previous/next
nnoremap <silent>    <A-,> :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bp<CR>
nnoremap <silent>    <A-.> :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bn<CR>
nnoremap <silent>    <C-h> :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bp<CR>
nnoremap <silent>    <C-l> :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bn<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Close buffer
nnoremap <silent>    <A-w> :bd<CR>


" COLORIZER
" ---------------------------------------------------------------------
lua require'colorizer'.setup()


" LEADERF
" ---------------------------------------------------------------------
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

"let g:Lf_ShortcutF = "<Leader>ff"

noremap <Leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <Leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <Leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <Leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-P> :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap <C-S-P> <:<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

