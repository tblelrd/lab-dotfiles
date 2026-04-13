-- Use lazy.nvim to do plugins
require("config.lazy")

--
-- Essential Stuff
--

vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.shiftround = true; -- Indents go to nearest shiftwidth.

-- Show both number and sign (warnings and errors).
vim.opt.signcolumn = 'yes'
vim.opt.number = true;
vim.opt.relativenumber = true;

vim.opt.wrap = false
vim.opt.sidescroll = 1 -- scroll horizontally 1 column at a time
vim.opt.sidescrolloff  = 8 -- keep 8 columns visible either side of cursor

-- Save colorschemes on exit.
local theme = require('last-color').recall() or 'hybrid'
vim.cmd.colorscheme(theme)
-- vim.cmd.colorscheme("hybrid")

-- Notifications last too long
require("notify").setup({ timeout = 500 });

--
-- Custom looks config.
--

vim.opt.winborder = "rounded"
vim.opt.fillchars = {
    vert      = '│',   -- vertical split separator
    horiz     = '─',   -- horizontal split separator
    horizup   = '┴',
    horizdown = '┬',
    vertleft  = '┤',
    vertright = '├',
    verthoriz = '┼',
}

--
-- Custom Keybinds (Non-plugin)
--

-- Esc instead of ctrl c
vim.keymap.set({"n", "x", "o"}, "<C-c>", "<Esc>", { silent = true })

-- Quicker window move keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Center ctrl u and d
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go up half page', silent = true })
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Down half page', silent = true })

-- Quick save and exit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file", silent = true })
vim.keymap.set("n", "<leader>q", ":confirm q<CR>", { desc = "Quit file", silent = true })

-- Save to clipboard keybind
vim.keymap.set("v", "Y", "\"+y", { desc = "Yank to clipboard", silent = true })

-- Managers
require("which-key").add({
    { "<leader>p", group = "Package Managers"}
})
vim.keymap.set("n", "<leader>pm", ":Mason<CR>", { desc = "Open Mason", silent = true })
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { desc = "Open Lazy", silent = true })

-- LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
        end

        map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
        map('n', 'gr', vim.lsp.buf.references, "Get references")
        map('n', 'K', vim.lsp.buf.hover, "Show signature help")
        -- map('n', '[d', vim.diagnostic.goto_prev, "Next diagnostic")
        -- map('n', ']d', vim.diagnostic.goto_next, "Previous diagnostic")

        require("which-key").add({
            { "<leader>l", group = "LSP commands" }
        })
        map('n', '<leader>lr', vim.lsp.buf.rename, "Rename symbol")
        map('n', '<leader>la', vim.lsp.buf.code_action, "Show code actions")
        map('n', '<leader>lA', function()
            vim.lsp.buf.code_action({
                range = {
                    start = { 1, 0 },
                    ['end'] = { vim.api.nvim_buf_line_count(0), 0 },
                },
            })
        end, "Show all code actions")

        map('n', '<leader>lh', vim.lsp.buf.signature_help, "Show function parameter help")

        -- current line diagnostics (floating window)
        map('n', '<leader>ld', vim.diagnostic.open_float, 'Line diagnostics')

        -- all buffer diagnostics in telescope
        map('n', '<leader>lD', function()
          require('telescope.builtin').diagnostics({ bufnr = 0 })
        end, 'Buffer diagnostics')

        -- all diagnostics across ALL open buffers
        map('n', '<leader>lw', function()
          require('telescope.builtin').diagnostics()
        end, 'Workspace diagnostics')
    end,
})

--
-- Annoying stuff / workarounds.
--

require("notify").setup({
  background_colour = "#000000",
})

vim.keymap.set({"n", "v"}, "J", "<nop>", { desc = "Disable this annoying keybind" })

-- Remove autocomment on new line.
-- (Use gco from Comment.nvim instead)
-- Taken from https://github.com/dpetka2001/dotfiles/blob/43ecf1a6c1f1c8bf4ffe6fbc591f46db25b592db/dot_config/nvim/lua/config/autocmds.lua#L31-L44
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
augroup("mygroup", { clear = true })
autocmd("Filetype", {
  pattern = { "*" },
  callback = function()
    -- vim.opt.formatoptions = vim.opt.formatoptions - "o"
    vim.opt.formatoptions = vim.opt.formatoptions + {
      o = false, -- Don't continue comments with o and O
    }
  end,
  group = "mygroup",
  desc = "Don't continue comments with o and O",
})
