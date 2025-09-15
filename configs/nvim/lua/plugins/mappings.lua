return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      -- first key is the mode
      n = {
        ["<A-j>"] = { "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      },
      t = {
        ["<A-t>"] = { "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      },
    },
  },
}
