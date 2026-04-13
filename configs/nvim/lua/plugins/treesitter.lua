-- Now requires the tree-sitter-cli
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate'
}
