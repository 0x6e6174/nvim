return {
    'preservim/tagbar',
    config = function()
        vim.keymap.set('n', '<leader>o', ':TagbarToggle<CR>', {})
    end
}
