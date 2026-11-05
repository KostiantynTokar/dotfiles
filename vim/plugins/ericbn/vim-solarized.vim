Plug 'ericbn/vim-solarized'

augroup SolarizedOverrides
    autocmd!
    autocmd! ColorScheme solarized highlight CocErrorHighlight cterm=underline gui=undercurl guisp=#f7768E
augroup end
