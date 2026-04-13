return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            local autopairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            local cond = require('nvim-autopairs.conds')

            autopairs.setup({
                check_ts = true,
                -- don't close single quotes when next to a word character
                enable_check_bracket_line = true,
                ignored_next_char = "[%w%.]",
            })

            -- don't pair ' when preceded by a word character
            local single_quote = Rule("'", "'")
            :with_pair(cond.not_before_regex('[%w]'))
            :with_pair(cond.not_after_regex('[%w]'))
            autopairs.add_rule(single_quote)
        end,
    },
    -- Using <leader>/ to comment in normal in visual mode.
    {
        'numtostr/comment.nvim',
        opts = {
            -- In normal mode
            toggler = {
                ---Line-comment toggle keymap
                line = '<leader>/',
            },
            -- In visual mode
            opleader = {
                ---Line-comment keymap
                line = '<leader>/',
            },
        },
    },
    {
        -- For surround.
        'nvim-mini/mini.nvim',
        verrion = '*',
        config = function()
            require('mini.surround').setup({})
        end
    },
    {
        -- Toggling lists to be single or spread.
        'Wansmer/treesj',
        keys = {
            { "zj", mode = { "n" }, function() require("treesj").toggle() end, desc = "Toggle list format"},
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    }
}
