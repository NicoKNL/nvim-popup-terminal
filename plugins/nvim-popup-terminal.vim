if exists("g:loaded_nvim_popup_terminal")
    finish
endif

let g:loaded_nvim_popup_terminal = 1

function! NvimPopupTerminal()
    lua require("nvim-popup-terminal").openTerminal()
endfunction
