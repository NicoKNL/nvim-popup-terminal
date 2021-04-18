local function openTerminal()
    local ui_stats = vim.api.nvim_list_uis()[1]
    local width    = ui_stats.width
    local height   = ui_stats.height

    local buffer = vim.api.nvim_create_buf(false, true)
    local window = vim.api.nvim_open_win(buffer, true, {
            relative = "editor",
            width    = width - 8,
            height   = height - 8,
            col      = 8,
            row      = 4
        })
    vim.cmd("term")
    vim.cmd("startinsert")
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Esc>", ":q!<CR>", {})
end

return 
{
    openTerminal = openTerminal
}
