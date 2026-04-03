vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

vim.keymap.set("n", "J", "<nop>", { desc = "Disable join lines" })

vim.api.nvim_create_user_command("LspLogClear", function()
	local lsplogpath = vim.fn.stdpath("state") .. "/lsp.log"
	print(lsplogpath)
	if io.close(io.open(lsplogpath, "w+b")) == false then vim.notify("Clearning LSP Log failed.", vim.log.levels.WARN) end
end, { nargs = 0 })
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
