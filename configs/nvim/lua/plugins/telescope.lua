return {
    {
        'nvim-telescope/telescope.nvim', version = '0.2.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {
                    -- layout_strategy = 'horizontal',
                    -- layout_config = { preview_width = 0.55 },
                    mappings = {
                        -- Ctrl j and k to move selection.
                        i = {
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    }
                }
            })

            telescope.load_extension("ui-select")

            require("which-key").add({
                { "<leader>f", group = "Telescope" }
            })

            -- keymaps
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader>fF', function()
                builtin.find_files{ no_ignore = true, hidden = true, }
            end, { desc = 'Find files' })

            vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Find words (ripgrep)' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

            -- No idea how this works but shows preview of current file
            vim.keymap.set('n', '<leader>ft', function()
                builtin.colorscheme({ enable_preview = true })
            end, { desc = 'Colorschemes' })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        opts = {},
    }
}
