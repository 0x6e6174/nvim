return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = { "VeryLazy" },
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<c-\>]],
        })
    end
}
