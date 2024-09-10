function get_mode_highlight(mode)
    local mode_highlights = {
        n = "%#MyNormalMode#",
        i = "%#MyInsertMode#",
        t = "%#MyInsertMode#",
        v = "%#MyVisualMode#",
        V = "%#MyVisualMode#",
        [""] = "%#MyVisualMode#",
        c = "%#MyDefaultMode#",
        s = "%#MyDefaultMode#",
        S = "%#MyDefaultMode#",
        [""] = "%#MyDefaultMode#",
        R = "%#MyDefaultMode#",
        Rv = "%#yDefaultMode#",
    }

    return mode_highlights[mode] or "MyDefaultMode"
end

function get_mode_name(mode)
    local mode_map = {
        n = "Normal",
        i = "Insert",
        t = "Terminal",
        v = "Visual",
        V = "V-Line",
        [""] = "V-Block",
        c = "Command",
        s = "Select",
        S = "S-Line",
        [""] = "S-Block",
        R = "Replace",
        Rv = "V-Replace",
    }
    return mode_map[mode]
end

function format_filename()
    return vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:t') or 'nil'
end

function get_line_chars()
    return string.format('%s:%s', vim.fn.col('.')-1, vim.fn.col('$')-1)
end

function get_diagnostic_count()
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr)

    local warning_count = 0
    local error_count = 0

    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Warning then
            warning_count = warning_count + 1
        elseif diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
            error_count = error_count + 1
        end
    end

    if warning_count + error_count == 0 then
        return ''
    elseif error_count == 0 then
        return '[%#CustomWarnHl#' .. 'W ' .. warning_count .. '%*]'
    elseif warning_count == 0 then
        return "[%#CustomErrorHl#E " .. error_count .. '%*]'
    end
    return "[%#CustomErrorHl#E " .. error_count .. '%*] [%#CustomWarnHl#' .. 'W ' .. warning_count .. '%*]'
end

function get_buffer_perms()
    local readable = vim.loop.fs_access(vim.fn.expand('%'), 'R')
    local writable = vim.loop.fs_access(vim.fn.expand('%'), 'W')
    local executable = vim.loop.fs_access(vim.fn.expand('%'), 'X')

    local permissions = ""
    if readable then
        permissions = permissions .. "r"
    end
    if writable then
        permissions = permissions .. "w"
    end
    if executable then
        permissions = permissions .. "x"
    end

    return permissions
end

local function statusline()
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
    local filetype = " %y"
    local percentage = "(%p%%)"
    local linecol = "[%l:%L][%{luaeval('get_line_chars()')}]"
    local perms = ' %{luaeval("get_buffer_perms()")}'
    local diagnostics = ' %{% luaeval("get_diagnostic_count()")%}'

    local mode_name = '%{luaeval("get_mode_name(vim.fn.mode())")}'
    local buffer = " %{luaeval('format_filename()')}" -- vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:t') or 'nil'
    local mode_highlight = '%{%(luaeval("get_mode_highlight(vim.fn.mode())"))%}'
    local rm_highlight = '%*'

    return string.format(
        "%s [%s] %s%s%s%s%s%s%s%s%s%s%s ",
        mode_highlight,
        mode_name,
        rm_highlight,
        "%#StatusLine#",
        buffer,
        modified,
        linecol,
        percentage,
        diagnostics,
        align_right,
        filetype,
        fileencoding,
        perms
    )
end

vim.opt.statusline = statusline()
