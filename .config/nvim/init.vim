" =======================================
" # Plugins
" =======================================
call plug#begin()

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'hoob3rt/lualine.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'romainl/vim-cool'               " Disables highlight when search is done
Plug 'easymotion/vim-easymotion'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'godlygeek/tabular', { 'for': ['text', 'markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['text', 'markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['text', 'markdown']  }
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'chiefnoah/neuron-v2.vim', { 'for': ['text', 'markdown'] }
Plug 'sedm0784/vim-you-autocorrect', { 'for': ['text', 'markdown', 'tex'] }

" Themes
"Plug 'overcache/NeoSolarized'
Plug 'morhetz/gruvbox'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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
set noshowmode
" Show line numbers.
set number
" relative line numbering
" set relativenumber
" show lines above and below cursor (when possible)
set scrolloff=5 
set laststatus=2
set backspace=indent,eol,start
set updatetime=100
set hidden
" Enable mouse support.
set mouse+=a
"For search
set ignorecase
set smartcase
set incsearch
set wrapscan          " wrap around
set ignorecase
set smartcase

" Colorscheme
set termguicolors
set background=dark
"colorscheme NeoSolarized
colorscheme gruvbox

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

"exuberant-tags support
set tags=./tags;/

" =======================================
" # Custom Key Mapping
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
tnoremap <C-\> <C-\><C-n>

nnoremap <Leader>q :q
nnoremap <Leader>w :w

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

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

command! -nargs=* Note call zettel#edit(<f-args>)
imap <c-x><c-f> <plug>(fzf-complete-path)

"use relative lines unless focus lost
autocmd FocusLost * :set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber

" =======================================
" # Plugin Setup
" =======================================

" fzf
"""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


nnoremap <silent> <c-p> :Files<CR>
nnoremap ; :Buffers<CR>
nnoremap <Leader>f :RG<CR>

"FZF Buffer Delete

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

"Call the function by :BD
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" treesitter
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF

" ultisnips
"""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" nvim-tree
"""""""""""""""""""""""""""""""""""""""""
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': ""
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
nnoremap <leader>n :NvimTreeToggle<CR>

" lualine
"""""""""""""""""""""""""""""""""""""""""
let g:lualine = {
    \'options' : {
    \  'theme' : 'gruvbox',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'icons_enabled' : v:true,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
    \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ 'fzf' ],
    \}
lua require("lualine").setup()

" vim-markdown
"""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 3
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

" vimtex
"""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
"let g:vimtex_view_method='okular'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" vim-you-autocorrect
"""""""""""""""""""""""""""""""""""""""""
augroup ILoveCorrections
 autocmd!
 autocmd BufEnter *.tex,*.md EnableAutocorrect
augroup END
nmap <Leader>u <Plug>VimyouautocorrectUndo
imap <F3> <C-O><Plug>VimyouautocorrectUndo
nmap [s <Plug>VimyouautocorrectJump
nmap [s <Plug>VimyouautocorrectPrevious

" Coc
"""""""""""""""""""""""""""""""""""""""""
" 'Smart' navigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>

" coc-spell-check
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
"
" =======================================
" # Template autoload
" =======================================
" 0r is used to add text from the first line 
" If not used a newline is present when it insert the template
autocmd BufNewFile *.tex 0r ~/.config/nvim/template/tex-template.tex
"autocmd BufEnter *.tex  normal! zz35<CR>
