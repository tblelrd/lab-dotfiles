return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- if you want to enable coloring of ANSI escape codes in
    -- compilation output, add:
    { "m00qek/baleia.nvim" },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
        -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
        -- set this to fix tab completion in command mode:
        -- input_word_completion = true,

        -- Don't want anything as default command.
        default_command = "",

        -- to add ANSI escape code support, add:
        baleia_setup = true,

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
    }

    require("which-key").add({
        { "<leader>c", group = "Compile commands" }
    })

    vim.keymap.set("n", "<leader>cc", ":Compile<cr>", { desc = "Run a compile command", silent = true })
    vim.keymap.set("n", "<leader>cp", ":Recompile<cr>", { desc = "Run previous compile command", silent = true })
  end
}
