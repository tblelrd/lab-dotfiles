return {
    {
        -- No setup as apparently it self loads?
        'raddari/last-color.nvim'
    },
    {
        "HoNamDuong/hybrid.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim",
        name = 'catpuccin',
        lazy = false,
        priority = 1000,
        config = function ()
            require('catppuccin').setup({
                flavour = "mocha",
                transparent_background = true,
            });
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
