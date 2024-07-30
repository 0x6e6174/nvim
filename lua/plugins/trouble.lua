return {
   "folke/trouble.nvim",
    event = { "LspAttach" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "",
        },
    },
}

