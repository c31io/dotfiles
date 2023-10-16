return {
    {
        'hrsh7th/nvim-cmp', -- Autocompletion plugin
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            require 'config.cmp'
        end
    },
}
