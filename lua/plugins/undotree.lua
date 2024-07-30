return {
    'mbbill/undotree',
    config=function()
        vim.keymap.set('n', '<C-u>', ':Neotree close<CR>:UndotreeToggle<CR>', {})
    end,
}
