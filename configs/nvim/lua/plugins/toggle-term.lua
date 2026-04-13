return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = { [[<F7>]] }, -- This is because my tmux config maps ctrl+' to f7
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 3,
            },
        })

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        local bacon = Terminal:new({ cmd = "bacon", hidden = true })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        function _bacon_toggle()
            bacon:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tl", ":lua _lazygit_toggle()<CR>", { desc = "Toggle Lazygit", noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>tb", ":lua _bacon_toggle()<CR>", { desc = "Toggle Bacon", noremap = true, silent = true})

        vim.api.nvim_set_keymap("t", "<C-space>", "<C-\\><C-N>", { desc = "Normal mode in terminal", noremap = true, silent = true })
    end
}
