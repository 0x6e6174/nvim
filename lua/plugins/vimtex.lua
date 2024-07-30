return {
    'lervag/vimtex',
    config = function()
        vim.g.vimtex_view_method = 'zathura'
        vim.api.nvim_set_keymap('n', '<leader>ll', [[:VimtexCompile<CR>]], { noremap = true, silent = true })
    end,
    event = "FileType tex"
}
