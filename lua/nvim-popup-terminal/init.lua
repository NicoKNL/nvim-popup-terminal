local editor_width    = 0
local editor_height   = 0
local default_padding = 8

local border_window_id   = nil
local terminal_window_id = nil

local function createBorderWindow()
    local padding = default_padding + 2

    local buffer = vim.api.nvim_create_buf(false, true)
    border_window_id = vim.api.nvim_open_win(buffer, true, {
            relative = "editor",
            width    = editor_width  - padding * 2,
            height   = editor_height - padding,
            col      = padding * 2,
            row      = padding,
            style    = "minimal"
        })
    -- draw border here
    return window
end

local function createTerminalWindow()
    local padding = default_padding

    local buffer = vim.api.nvim_create_buf(false, true)
    terminal_window_id = vim.api.nvim_open_win(buffer, true, {
            relative = "editor",
            width    = editor_width  - 2 * padding,
            height   = editor_height -     padding,
            col      = 2 * padding,
            row      = padding
        })

    vim.cmd("term")
    vim.cmd("startinsert")

    return window
end

local function destroyBorderWindow()
    vim.api.nvim_win_close(border_window_id, true)
    border_window_id = nil
end

local function destroyTerminalWindow()
    vim.api.nvim_win_close(terminal_window_id, true)
    terminal_window_id = nil
end

local function closeTerminal()
    destroyTerminalWindow()
    destroyBorderWindow()
end

local function openTerminal()
    local ui_stats = vim.api.nvim_list_uis()[1]
    editor_width    = ui_stats.width
    editor_height   = ui_stats.height
    
    local border_window   = createBorderWindow()
    local terminal_window = createTerminalWindow()
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Esc>", ":lua require('nvim-popup-terminal').closeTerminal()<CR>", {})
end

return 
{
    openTerminal  = openTerminal,
    closeTerminal = closeTerminal
}
