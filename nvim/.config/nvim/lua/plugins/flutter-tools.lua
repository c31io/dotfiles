return {
    {
        'akinsho/flutter-tools.nvim',
        lazy = true,
        ft = 'dart',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = function()
            require 'flutter-tools'.setup()
        end
    },
}
