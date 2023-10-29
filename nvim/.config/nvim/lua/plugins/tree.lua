return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        event = 'VeryLazy',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            -- Disable netrw for nvim-tree.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            -- Enable highlight groups
            vim.opt.termguicolors = true
            require 'nvim-tree'.setup()
            vim.keymap.set('n', '<C-w>;', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        end
    },
}
