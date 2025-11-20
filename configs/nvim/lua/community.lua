-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- Ordered in descending good order.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.hybrid-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.colorscheme.oldworld-nvim" },
  { import = "astrocommunity.colorscheme.horizon-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.pack.nix" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.lsp.nvim-java" },
   -- import/override with your plugins folder
}
