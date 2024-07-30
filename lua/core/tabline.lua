function custom_tabline()
    local current_tab = vim.fn.tabpagenr()
    local tabline = ''
    for t = 1, vim.fn.tabpagenr('$') do
        local win_count = vim.fn.tabpagewinnr(t, '$')
        local buflist = vim.fn.tabpagebuflist(t)
        local bufnr = buflist[1]

        tabline = tabline .. (t == current_tab and '%#tabSepInactive2#' or '%#tabSepInactive2#')
        tabline = tabline .. (t == current_tab and '%#tabSepSpecial#' or '')
        tabline = tabline .. (t == current_tab and '%#tabActive#' or '%#tabInactive#')
        tabline = tabline .. ' ' .. (t-1)..': '
        --tabline = tabline .. ' '
        tabline = tabline .. ' ' .. vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t') .. ' '
        tabline = tabline .. ' '
        tabline = tabline .. (t == current_tab and '%#tabSepActive#' or '%#tabSepInactive#')
        tabline = tabline .. '%*'
    end
    return tabline .. '%*'
end

-- vim.o.tabline = '%{%luaeval("custom_tabline()")%}'

