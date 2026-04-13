return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- Remove lsp stuff since blink handles it.
        lsp = {
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            }
        },
        -- HACK: Treesitter is being annoying.
        cmdline = {
            format = {
                cmdline = { lang = "" },
                search_down = { lang = "" },
                search_up = { lang = "" },
                filter = { lang = "" },
                lua = { lang = "" },
            },
        },
        routes = {
            -- Get rid of that annoying ass "Press :qa! to exit neovim!!" fuckass notification.
            {
                filter = {
                    event = "msg_show",
                    find = ":qa",
                },
                opts = { skip = true },
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
    },
    keys = {
        { "<leader>n", "", desc = "Noice notifications"},
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
        { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
        { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
        { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
        { "<leader>nt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
}
