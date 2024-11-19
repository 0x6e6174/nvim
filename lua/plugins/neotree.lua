return {
    "nvim-neo-tree/neo-tree.nvim",
    event = { "VeryLazy" },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup({
            renderers = {
                directory = {
                    { "indent" },
                    { "current_filter" },
                    {
                        "container",
                        content = {
                            { "name", zindex = 10 },
                            { "clipboard", zindex = 10 },
                            {
                                "git_status",
                                zindex = 20,
                                align = "right",
                                hide_when_expanded = true,
                                symbols = {
                                    added          = 'A',
                                    modified       = 'M',
                                    removed        = 'R',
                                    ignored        = 'I',
                                    untracked      = 'U',
                                    staged         = 'S',
                                }

                            },
                            { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                        },
                    },
                },
                file = {
                    { "indent" },
                    {
                        "container",
                        content = {
                            { "name", zindex = 10 },
                            { "clipboard", zindex = 10 },
                            { "bufnr", zindex = 10 },
                            { "modified", zindex = 20, align = "right", symbol = 'M' },
                            {
                                "git_status",
                                zindex = 20,
                                align = "right",
                                symbols = {
                                    added          = 'A',
                                    modified       = 'M',
                                    removed        = 'R',
                                    ignored        = 'I',
                                    untracked      = 'U',
                                    staged         = 'S',
                                }
                            },
                            { "diagnostics",  zindex = 20, align = "right" },
                        },
                    },
                },
            }
        })
        vim.api.nvim_set_keymap('n', '<leader><tab>', ':UndotreeHide<CR>:Neotree toggle<CR>', {})
    end
}
