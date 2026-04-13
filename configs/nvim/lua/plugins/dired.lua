return {
    "X3eRo0/dired.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("dired").setup {
            path_separator = "/",
            show_banner = false,
            show_icons = false,
            show_hidden = true,
            show_dot_dirs = true,
            show_colors = true,
            override_cwd = false,
        }

        vim.keymap.set("n", "<leader>e", ":Dired<CR>", { desc = "Open Dired", silent = true })
        vim.keymap.set("n", "<leader>d", function ()
            local dir = vim.fn.expand("%:p:h")
            if dir == "" then
                print("No file name")
                return
            end
            vim.cmd.cd(dir)
            print("dir: " .. dir)
        end, { desc = "Change working directory to here" })
    end
}
