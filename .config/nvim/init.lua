-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run='make' }

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'numToStr/Comment.nvim'

  -- LSP, autocompletion and snippets
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'ggandor/lightspeed.nvim'
  use {'kyazdani42/nvim-tree.lua', requires = {
    'kyazdani42/nvim-web-devicons'
  }}
  use 'tpope/vim-repeat'
  use 'windwp/nvim-autopairs'

  use 'kevinhwang91/nvim-bqf'
  use 'hoob3rt/lualine.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Disables highlight when search is done
  use 'romainl/vim-cool'                
  use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons' 
  use 'folke/which-key.nvim' 

  use { 'plasticboy/vim-markdown', ft={'markdown'}}
  use { 'godlygeek/tabular', ft={'markdown'}}
  use { 'ellisonleao/glow.nvim', ft={'markdown'}}
  use { 'lervag/vimtex', ft={'tex'}}
  use { 'sedm0784/vim-you-autocorrect', ft={'text', 'markdown', 'tex'}}

  use 'ful1e5/onedark.nvim' 
end)

-----------------------------------------
-- # General
-----------------------------------------
--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.showmode = false
--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.scrolloff = 5
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.splitbelow = true
vim.o.splitright = true

-- shiftwidth- when indenting with >,use 4 spaces width
-- expandtab- show existing tab with 4 spaces width
-- tabstop-on pressing tab insert 4 spaces
-- softtabstop- makes the spaces feel like real tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

--Set colorscheme (order is important here)
-- vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2
-- vim.cmd [[colorscheme onedark]]

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

-----------------------------------------
-- # Custom Key Mapping
-----------------------------------------

-- Toggle relative number
vim.api.nvim_set_keymap('n', '<C-n>', ':set rnu!<CR>', {silent = true})

--  y d p P  Quick copy paste into system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>d', '"+d', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', {silent = true})

-- quicker window movement
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>q', ':q', {noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w', {noremap = true })

-- Bring search results to midscreen
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true })

-- Quickly switch between two recent buffer
vim.api.nvim_set_keymap('n', '<backspace>', '<C-^>', {noremap = true })

vim.api.nvim_set_keymap('n', 'Q', '@@', {noremap = true })
vim.api.nvim_set_keymap('x', '<', '<gv', {noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', {noremap = true })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Saner behavior for n and N
-- vim.api.nvim_set_keymap('n', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('x', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('o', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true, silent = true })
--
-- vim.api.nvim_set_keymap('n', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('x', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('o', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true, silent = true })
--
-- Move lines in visual mode
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true })
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true })

-----------------------------------------
-- # Plugin Setup
-----------------------------------------

-- nvim-tree
------------------------------------------
vim.g.nvim_tree_indent_markers = 1

require'nvim-tree'.setup {
  auto_close = true,
}

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', {noremap = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeToggle<CR>', {noremap = true })

-- onedark
------------------------------------------
require("onedark").setup({
  function_style = "italic", 
  highlight_linenumber = false,
})

-- which-key
------------------------------------------
require("which-key").setup{
  plugins = {
    spelling = {
      enabled = true
    }
  }
}

-- lualine
------------------------------------------
require("lualine").setup {
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
    lualine_c = {'filename'},
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
  extensions = {'nvim-tree', 'quickfix'}
}

-- comment.nvim
------------------------------------------
require'Comment'.setup {
}

-- Gitsigns
------------------------------------------
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-- cmp-tabnine
------------------------------------------
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
})

-- vim-markdown
------------------------------------------
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_no_extensions_in_markdown = 1

-- vim-markdown
------------------------------------------
vim.g.tex_flavor='latex'
vim.g.vimtex_quickfix_mode=0
vim.g.tex_conceal='abdmg'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
vim.g.vimtex_view_general_options_latexmk = '--unique'
vim.o.conceallevel=1

-- Telescope
------------------------------------------
local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<esc>'] = actions.close,
        ["<M-p>"] = actions_layout.toggle_preview,
      },
      n = {
        ["<M-p>"] = actions_layout.toggle_preview,
      }
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
    live_grep = {
      only_sort_text = true,
    },
    buffers = {
      sort_lastused = true,
    },
  },
}

require('telescope').load_extension('fzf')

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').resume()<CR>]], { noremap = true, silent = true })

-- lightspeed
------------------------------------------
require'lightspeed'.setup {
}

-- nvim-autopairs
------------------------------------------
require("nvim-autopairs").setup{

}

-- Treesitter configuration
------------------------------------------
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
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
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- LSP settings
------------------------------------------
local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- nvim-cmp
------------------------------------------
require("luasnip/loaders/from_vscode").lazy_load()
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  -- You should specify your *installed* sources.
  sources = {
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
  experimental = {
    ghost_text = true,
  },
}

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      cmp_tabnine = "[TabNine]",
      path = "[Path]",
    })}),
  }
}
