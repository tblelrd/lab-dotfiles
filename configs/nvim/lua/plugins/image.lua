if (true) then return {} end

return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
            rocks = { "magick" },
        },
    },
    {
        '3rd/image.nvim',
        opts = {},
    },
}
