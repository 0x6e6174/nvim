local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<C-l>h', vim.lsp.buf.hover, {})
end

local servers = {
                'asm_lsp',
                'bashls',
                'clojure_lsp',
                'cmake',
                'cssls',
                'fennel_language_server',
                'html',
                'jqls',
                'jsonls',
                'pyright',
                'rust_analyzer',
                'clangd',
                'verible',
                'vimls',
                'luau_lsp',
                'lua_ls',
                'emmet_language_server',
            }


local border = 'rounded'

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border, focus = false}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border, focus = false}),
}

return {
    event={ "VeryLazy" },
    'neovim/nvim-lspconfig',
    config = function()
        local nvim_lsp = require('lspconfig')
        require('mason')
        require('mason-lspconfig').setup({
            ensure_installed = servers
        })
        for _, lsp in ipairs(servers) do
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            if lsp ~= 'emmet-language-server' then
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    autostart = true,
                    capabilities = lsp_capabilities,
                    handlers = handlers,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
            else
                nvim_lsp.emmet_language_server.setup({
                  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
                  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                  -- **Note:** only the options listed in the table are supported.
                  init_options = {
                    ---@type table<string, string>
                    includeLanguages = {},
                    --- @type string[]
                    excludeLanguages = {},
                    --- @type string[]
                    extensionsPath = {},
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                    preferences = {},
                    --- @type boolean Defaults to `true`
                    showAbbreviationSuggestions = true,
                    --- @type "always" | "never" Defaults to `"always"`
                    showExpandedAbbreviation = "always",
                    --- @type boolean Defaults to `false`
                    showSuggestionsAsSnippets = false,
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                    syntaxProfiles = {},
                    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                    variables = {},
                  },
                })
            end
        end
        vim.cmd([[LspStart]])
    end
}


