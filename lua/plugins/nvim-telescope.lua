return {
    lazy = true,
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require("telescope.actions")
        local keymap = vim.api.nvim_set_keymap

        require('telescope').setup({
            extensions = {
                media = {
                    backend = "ueberzug",
                    backend_options = {
                        xmove = -1, 
                        ymove = -2, 
                        warnings = true, 
                        supress_backend_warning = false
                    },
                }
            },
            defaults = {
                prompt_prefix = "λ ",
                selection_caret = "-> ",
                mappings = {
                    i = {
                        ["<C-h>"] = actions.which_key,
                        ["<C-k>"] = actions.move_selection_next,
                        ["<C-j>"] = actions.move_selection_previous,
                    }
                }
            },
            pickers = {
                buffers = {
                    sort_lastused = true,
                    previewer = false,
                    layout_config = {
                        width = 0.3,
                        height = 0.4,
                    },        
                },
                planets = {
                    show_pluto = true,
                },
            },
            extensions = {}
        })
        keymap('n', '<leader><leader>', ':Telescope find_files<CR>', {})
        keymap('n', '<leader>m', ':Telescope media<CR>', {})
        keymap('n', '<leader>b', ':Telescope buffers<CR>', {})
        keymap('n', '<leader>t', ':Telescope<CR>', {})
        keymap('n', '<leader>g', ':Telescope live_grep<CR>', {})
    end,
}
