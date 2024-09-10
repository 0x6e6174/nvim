function capitalize_head(str)
    str = string.lower(str)
    str = string.gsub(str, "^%l", string.upper)
    return str
end

local signs = {
  [vim.diagnostic.severity.ERROR] = "E",
  [vim.diagnostic.severity.WARN] = "W",
  [vim.diagnostic.severity.HINT] = "H",
  [vim.diagnostic.severity.INFO] = "I"
}

vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = false,

  signs = {
    severity = { min = vim.diagnostic.severity.HINT },
    text = signs,
    priority = 4,
  },

  float = {
    max_width = math.min(math.floor(vim.o.columns * 0.7), 100),
    max_height = math.min(math.floor(vim.o.lines * 0.3), 30),
    border = border_style,
    title = { { '  ', 'DiagnosticFloatTitleIcon' }, { 'Problems  ', 'DiagnosticFloatTitle' } },
    focusable = false,
    scope = 'line',
    source = 'if_many',
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = string.format('%s ', signs[diag.severity])
      return prefix, 'Diagnostic' .. level:gsub('^%l', string.upper)
    end,
  },
})

for severity, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. capitalize_head(vim.diagnostic.severity[severity])
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

