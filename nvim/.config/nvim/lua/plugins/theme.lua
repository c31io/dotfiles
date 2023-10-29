return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nightfox'.setup {
                options = { transparent = true }
            }
            vim.cmd.colorscheme 'terafox'
        end
    },

    {
        'feline-nvim/feline.nvim',
        lazy = false,
        config = function()
            require 'config.feline'
        end
    },

    {
        'nanozuki/tabby.nvim',
        lazy = false,
        config = function()
            require 'config.tabby'
        end
    },
}
