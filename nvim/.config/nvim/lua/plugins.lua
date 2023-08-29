local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'williamboman/mason.nvim' -- LSP manager
  use 'williamboman/mason-lspconfig.nvim' -- Configuration manager
  use 'neovim/nvim-lspconfig' -- Configurations for nvim LSP
  use 'simrat39/rust-tools.nvim' -- Rust auto setup
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP sources for nvim-cmp BEGIN
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer' -- LSP sources for nvim-cmp END
  use 'hrsh7th/vim-vsnip' -- LSP snippet
  use 'EdenEast/nightfox.nvim' -- Nightfox theme
  use 'feline-nvim/feline.nvim' -- Status line
  use 'nanozuki/tabby.nvim' -- Tab
  use 'nvim-treesitter/nvim-treesitter' -- Code folding
  use 'mfussenegger/nvim-dap' -- Debug adapter protocol
  use {
    'nvim-tree/nvim-tree.lua', -- File tree
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {'toppair/peek.nvim', run = 'deno task --quiet build:fast'} -- md preview
  use 'm4xshen/autoclose.nvim' -- Brackets auto closing
  use 'airblade/vim-gitgutter' -- Git delta
  use {
    'ggandor/leap.nvim', -- Motion
    requires = { {'tpope/vim-repeat'} }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- Fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }
end)

require('autoclose').setup()
require('mason').setup()
require('flutter-tools').setup()
require('leap').add_default_mappings()

-- Markdown preview
require('peek').setup()
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
