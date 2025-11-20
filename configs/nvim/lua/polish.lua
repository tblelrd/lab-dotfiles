vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

vim.keymap.set("n", "J", "<nop>", { desc = "Disable join lines" })
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
