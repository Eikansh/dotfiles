" =======================================
" # Plugins
" =======================================
call plug#begin()

" Declare the list of plugins.
Plug 'kevinhwang91/nvim-bqf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'f3fora/cmp-spell'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romainl/vim-cool'               " Disables highlight when search is done
Plug 'onsails/lspkind-nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-treesitter/nvim-treesitter', {'branch' : '0.5-compat'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
Plug 'folke/which-key.nvim'
Plug 'SmiteshP/nvim-gps'

Plug 'L3MON4D3/LuaSnip'
Plug 'b3nj5m1n/kommentary'
Plug 'ggandor/lightspeed.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rafamadriz/friendly-snippets'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

Plug 'godlygeek/tabular', { 'for': ['text', 'markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['text', 'markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'chiefnoah/neuron-v2.vim', { 'for': ['text', 'markdown'] }
Plug 'sedm0784/vim-you-autocorrect', { 'for': ['text', 'markdown', 'tex'] }
Plug 'tweekmonster/startuptime.vim'

" Themes
" Plug 'folke/tokyonight.nvim'
Plug 'monsonjeremy/onedark.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" =======================================
" # General
" =======================================
let mapleader = "\<Space>"
let maplocalleader="\<space>"

" Disable the default Vim startup message.
set shortmess+=I
"hide mode
set noshowmode
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
set wrapscan          " wrap around
set completeopt=menuone,noselect
set lazyredraw
set undofile

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"shiftwidth- when indenting with >,use 4 spaces width
"expandtab- show existing tab with 4 spaces width
"tabstop-on pressing tab insert 4 spaces
"softtabstop- makes the spaces feel like real tabs
set tabstop=2 shiftwidth=2 expandtab softtabstop=2
"set tabstop=4 shiftwidth=4 expandtab softtabstop=4 

" =======================================
" # Custom Key Mapping
" =======================================

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

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

" exit terminal mode
tnoremap <C-\> <C-\><C-n>

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

command! -nargs=* Note call zettel#edit(<f-args>)
imap <c-x><c-f> <plug>(fzf-complete-path)

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
nnoremap <Leader>s :RG<CR>

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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']]'] = '@function.outer',
        [']m'] = '@class.outer',
      },
      goto_next_end = {
        [']['] = '@function.outer',
        [']M'] = '@class.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
        ['[m'] = '@class.outer',
      },
      goto_previous_end = {
        ['[]'] = '@function.outer',
        ['[M'] = '@class.outer',
      },
    },
  },
}
EOF

" telescope
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" onedark
"""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("onedark").setup({
  functionStyle = "italic"
})
EOF

" lightspeed
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'lightspeed'.setup {
   jump_to_first_match = false,
 }
EOF

:highlight LightspeedShortcut guibg=#282c34 guifg=#ff00ff gui=bold,underline
:highlight LightspeedLabel guibg=#282c34 guifg=#ff00ff gui=bold,underline
:highlight LightspeedOneCharMatch guibg=#282c34 guifg=#ff00ff gui=bold,underline

" which-key
"""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("which-key").setup{
plugins = {
  spelling = {
    enabled = true
    }
  }
}
EOF

" gitsigns
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}
EOF

" nvim-tree
"""""""""""""""""""""""""""""""""""""""""
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 
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
nnoremap <leader>n :NvimTreeRefresh<CR>:NvimTreeToggle<CR>
nnoremap <leader>N :NvimTreeToggle<CR>

" nvim-gps
"""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("nvim-gps").setup{

}
EOF

" lualine
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local gps = require("nvim-gps")
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', gps.get_location, condition = gps.is_available},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fzf', 'nvim-tree', 'quickfix'}
}
EOF

" vim-markdown
"""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_folding_level = 3
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

" cmp-tabnine
lua<<EOF
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
	run_on_every_keystroke = true;
})
EOF

" LSP
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
  require'lspinstall'.setup()
  local nvim_lsp = require 'lspconfig'
  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
-- local servers = { 'clangd', 'pyright'}
local servers = require'lspinstall'.installed_servers()
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
 vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
EOF

" nvim-comp
"""""""""""""""""""""""""""""""""""""""""
lua <<EOF
  require("luasnip/loaders/from_vscode").lazy_load()
  local has_words_before = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match('^%s$')
  end

  local luasnip = require('luasnip')
  local cmp = require ('cmp')
  local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
  end
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
        elseif has_words_before() and luasnip.expand_or_jumpable() then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '', true)
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function()
        if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', true)
        elseif luasnip.jumpable(-1) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '', true)
        end
      end, { 'i', 's' }),
      },
    -- You should specify your *installed* sources.
    sources = {
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'spell' },
    },
  }

  local lspkind = require('lspkind')
  local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[Snippet]",
    path = "[Path]",
    spell = "[Spell]",
    cmp_tabnine = "[TN]",
    }
  cmp.setup {
    formatting = {
      format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
              if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                menu = entry.completion_item.data.detail .. ' ' .. menu
              end
              vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
          end
    }
  }
EOF

" =======================================
" # Template autoload
" =======================================
" 0r is used to add text from the first line 
" If not used a newline is present when it insert the template
autocmd BufNewFile *.tex 0r ~/.config/nvim/template/tex-template.tex
"autocmd BufEnter *.tex  normal! zz35<CR>
