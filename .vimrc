" =======================================
" # General
" =======================================
let mapleader = "\<Space>"
let maplocalleader="\<space>"

set nocompatible
" Turn on syntax highlighting.
syntax on
" enable file type detection
filetype plugin indent on 
set autoindent
" Disable the default Vim startup message.
set shortmess+=I
"hide mode
"set noshowmode
" Show line numbers.
set number
" relative line numbering
set relativenumber
" show lines above and below cursor (when possible)
set scrolloff=5 
set laststatus=2
set backspace=indent,eol,start
set updatetime=100
set timeoutlen=500
set hidden
" Enable mouse support.
set mouse+=a
"For search
set ignorecase
set smartcase
set incsearch
set wrapscan          " wrap around
set lazyredraw

" Colorscheme
set termguicolors
set background=dark
"colorscheme NeoSolarized
"colorscheme gruvbox

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"expandtab- show existing tab with 4 spaces width
"shiftwidth- when indenting with >,use 4 spaces width
"tabstop-on pressing tab insert 4 spaces
"softtabstop- makes the spaces feel like real tabs
set tabstop=2 shiftwidth=2 expandtab softtabstop=2
"set tabstop=4 shiftwidth=4 expandtab softtabstop=4 

" =======================================
" # Custom Shortcuts
" =======================================

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

"fly between buffers
nnoremap gb :ls<CR>:b<Space>

"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" <ESC> exit terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>q :q
nnoremap <Leader>w :w

" Bring search results to midscreen
nnoremap n nzz
nnoremap N Nzz

" Try to prevent bad habits like using the arrow keys for movement.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Unbind some useless/annoying default key bindings.
" nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
nnoremap Q @@
" Quickly switch between two recent buffer
nnoremap <Backspace> <C-^>
" Make Y behave like other capitals
nnoremap Y y$
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Saner behavior for n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv
" Move lines in visual mode
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
