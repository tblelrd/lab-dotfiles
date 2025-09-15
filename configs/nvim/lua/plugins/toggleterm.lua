return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<c-\>]],  -- or your custom mapping
    direction = "float",       -- 👈 This makes float the default terminal
    float_opts = {
      border = "curved",
      winblend = 3,
    },
  },
}
