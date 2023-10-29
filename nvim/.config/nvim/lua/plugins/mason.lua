return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require 'mason'.setup()
        end
    },

    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        event = 'VeryLazy',
        config = function()
            require 'mason-lspconfig'.setup()
        end
    },
}
