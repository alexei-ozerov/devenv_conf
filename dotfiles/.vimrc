syntax on
filetype plugin indent on
colorscheme slate

"VI Conf
set number
set backspace=indent,eol,start
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set fillchars+=vert:\
set relativenumber
set nocompatible
set encoding=utf-8
set wildmenu
set wildmode=longest,list,full

"Nerdtree Toggle
map <C-n> :NERDTreeToggle<CR>

"Split Nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Mode Switch
inoremap wj <Esc>
inoremap jw <Esc>

"Vim Plug
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
call plug#end()

"Show Docs
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gR :Lspsaga rename<CR>

"TODO: Fix autocomplete
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Airline Bar Conf
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

