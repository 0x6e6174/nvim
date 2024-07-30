return {
    "dharmx/telescope-media.nvim",
    event={ "VeryLazy" },
    config = function()
        require("telescope").load_extension("media")
    end,
}
