function capitalize_head_exclusive(str)
    str = string.lower(str)
    str = string.gsub(str, "^%l", string.upper)
    return str
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local max_width = math.min(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.min(math.floor(vim.o.lines * 0.3), 30)

vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = false and {
    spacing = 1,
    prefix = '', -- TODO: in nvim-0.10.0 this can be a function, so format won't be necessary
    format = function(d)
      local level = vim.diagnostic.severity[d.severity]
      return string.format('%s %s', signs[capitalize_head_exclusive(level)], d.message)
    end,
  },
  float = {
    max_width = max_width,
    max_height = max_height,
    border = border_style,
    title = { { '  ', 'DiagnosticFloatTitleIcon' }, { 'Problems  ', 'DiagnosticFloatTitle' } },
    focusable = false,
    scope = 'line',
    source = 'if_many',
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = string.format('%s ', signs[capitalize_head_exclusive(level)])
      return prefix, 'Diagnostic' .. level:gsub('^%l', string.upper)
    end,
  },
})

vim.cmd [[ autocmd! CursorHold * lua vim.diagnostic.open_float()]]

