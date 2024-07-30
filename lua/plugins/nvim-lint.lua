return {
    'mfussenegger/nvim-lint',
    event = { "VeryLazy" },
    config = function()
        require('lint').linters_by_ft = {
            markdown = {'vale',},
            python = {'pylint',},
        }
    end
}
