let g:loaded_nvim_popup_terminal = 1

function! NvimPopupTerminal()
    lua require("nvim-popup-terminal").openTerminal()
endfunction

augroup NICOKNL_NVIM_POPUP_TERMINAL
    autocmd!
augroup END
