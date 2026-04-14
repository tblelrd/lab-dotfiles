return {
    "stevearc/oil.nvim",
    config = function ()
        require("oil").setup({
            columns = {
                "icon",
                "permissions",
                "size"
            },
            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
                -- ["<C-p>"] = "actions.preview",
                -- ["<C-c>"] = { "actions.close", mode = "n" },
                -- ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            use_default_keymaps = false,
        })

        local actions = require("oil.actions");

        vim.keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "Open oil", silent = true })
        vim.keymap.set("n", "<leader>e", actions.open_cwd.callback, { desc = "Open oil", silent = true })
    end
}
