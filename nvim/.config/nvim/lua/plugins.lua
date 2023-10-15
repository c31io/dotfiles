local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'LazyVim/LazyVim',
    opts = { 
        colorscheme = 'terafox',
        news = { lazyvim = false },
    },
  },
  {
    'EdenEast/nightfox.nvim', -- Nightfox theme
    opts = { options = { transparent = true } },
  },
  'williamboman/mason.nvim', -- LSP manager
  'williamboman/mason-lspconfig.nvim', -- Configuration manager
  'neovim/nvim-lspconfig', -- Configurations for nvim LSP
  'simrat39/rust-tools.nvim', -- Rust auto setup
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    }
  },
  'hrsh7th/vim-vsnip', -- LSP snippet
  'feline-nvim/feline.nvim', -- Status line
  'nanozuki/tabby.nvim', -- Tab
  'nvim-treesitter/nvim-treesitter', -- Code folding
  'mfussenegger/nvim-dap', -- Debug adapter protocol
  {
    'nvim-tree/nvim-tree.lua', -- File tree
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {'toppair/peek.nvim', build = 'deno task --quiet build:fast'}, -- .md preview
  'm4xshen/autoclose.nvim', -- Brackets auto closing
  'airblade/vim-gitgutter', -- Git delta
  {
    'ggandor/leap.nvim', -- Motion
    dependencies = { {'tpope/vim-repeat'} }
  },
  {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- Optional for vim.ui.select
    },
  },
})

require('autoclose').setup()
require('mason').setup()
require('mason-lspconfig').setup()
require('flutter-tools').setup()
require('leap').add_default_mappings()

-- Markdown preview
require('peek').setup()
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
