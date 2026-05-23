" [count]["x]<leader>ro{motion}   Replace {motion} text with the contents of register x.
        "                         Especially when using the unnamed register, this is
        "                         quicker than \"_d{motion}P or \"_c{motion}<C-R>\"
" [count]["x]<leader>rl           Replace [count] lines with the contents of register x.
        "                         To replace from the cursor position to the end of the
        "                         line use ["x]gr$
" {Visual}["x]<leader>rv          Replace the selection with the contents of register x.
Plug 'vim-scripts/ReplaceWithRegister'
nmap <leader>ro <Plug>ReplaceWithRegisterOperator
nmap <leader>rl <Plug>ReplaceWithRegisterLine
xmap <leader>rv <Plug>ReplaceWithRegisterVisual
