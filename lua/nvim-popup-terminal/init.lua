local function createFloatingWindow(width, height, padding)
    local buffer = vim.api.nvim_create_buf(false, true)
    local window = vim.api.nvim_open_win(buffer, true, {
            relative = "editor",
            width    = width  - 2 * padding,
            height   = height -     padding,
            col      = 2 * padding,
            row      = padding
        })
    return buffer, window
end

local function createBorderWindow(width, height, padding)
    buffer, window = createFloatingWindow(width, height, padding)
    -- draw border here
    return window
end

local function createTerminalWindow(width, height, padding)
    buffer, window = createFloatingWindow(width, height, padding)
    vim.cmd("term")
    vim.cmd("startinsert")
    return window
end

local function destroyBorderWindow()
end

local function destroyTerminalWindow()
end

local function closeTerminal()
end

local function openTerminal()
    local ui_stats = vim.api.nvim_list_uis()[1]
    local width    = ui_stats.width
    local height   = ui_stats.height
    
    local border_window   = createBorderWindow(width, height, 8)
    local terminal_window = createTerminalWindow(width, height, 9)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Esc>", ":q!<CR>", {})
end

return 
{
    openTerminal = openTerminal
}
