function! NvimPopupTerminal()
    lua for k in pairs(package.loaded) do if k:match("^nvim%-popup%-terminal") then package.loaded[k] = nil end end
    lua require("nvim-popup-terminal").openTerminal()
endfunction

augroup NvimPopupTerminal
    autocmd!
    autocmd VimResized * :lua require("nvim-popup-terminal").onResize()
augroup END
