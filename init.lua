require 'core.keys'
require 'core.lazy'
require 'core.opts'
vim.api.nvim_command("source ~/.config/nvim/colors.vim")
require 'core.statusline'
require 'core.tabline'
require 'core.diagnostics'

local function set_terminal_title()
    local filepath = vim.fn.expand("%:p")
    local title = "vim - " .. filepath
    vim.fn.system(string.format("printf '\27]2;%s\7'", title))
end

-- vim.cmd([[autocmd BufEnter * lua set_terminal_title()]])

