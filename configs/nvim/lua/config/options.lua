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
