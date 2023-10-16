return {
    {
        'williamboman/mason.nvim', -- LSP manager
        lazy = false,
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim', -- Configuration manager
        lazy = true,
        event = 'VeryLazy',
        config = function()
            require('mason-lspconfig').setup()
        end
    },
}
