return {
    {
        'neovim/nvim-lspconfig', -- Configurations for nvim LSP
        lazy = true,
        event = 'VeryLazy',
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Code folding
        lazy = true,
        event = 'VeryLazy',
        config = function()
            require 'config.treesitter'
        end
    },
    {
        'mfussenegger/nvim-dap', -- Debug adapter protocol
        lazy = true,
        event = "VeryLazy",
        config = function()
            require 'config.dap'
        end
    },
    {
        'toppair/peek.nvim', -- .md preview
        lazy = true,
        ft = 'markdown',
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end
    },
    {
        'm4xshen/autoclose.nvim', -- Brackets auto closing
        lazy = true,
        event = "InsertEnter",
        config = function()
            require('autoclose').setup()
        end
    },
    {
    'airblade/vim-gitgutter', -- Git delta
        lazy = true,
        event = "VeryLazy",
    },
    {
        'ggandor/leap.nvim',  -- Motion
        lazy = true,
        keys = 's',
        dependencies = { { 'tpope/vim-repeat' } },
        config = function()
            require('leap').add_default_mappings()
        end
    },
}
