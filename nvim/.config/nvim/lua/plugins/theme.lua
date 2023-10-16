return {
    {
        'EdenEast/nightfox.nvim', -- Nightfox theme
        lazy = false,
        priority = 1000,
        config = function()
            require('nightfox').setup {
                options = { transparent = true }
            }
            vim.cmd.colorscheme 'terafox'
        end
    },
    {
        'feline-nvim/feline.nvim', -- Status line
        lazy = false,
        config = function()
            require 'config.feline'
        end
    },
    {
        'nanozuki/tabby.nvim', -- Tab
        lazy = false,
        config = function()
            require 'config.tabby'
        end
    },
}
