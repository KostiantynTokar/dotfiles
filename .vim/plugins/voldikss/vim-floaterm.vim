Plug 'voldikss/vim-floaterm'

let g:floaterm_borderchars = '─│─│╭╮╯╰'

let g:floaterm_keymap_new    = '<F2>'
" let g:floaterm_keymap_prev   = '<F7>'
" let g:floaterm_keymap_next   = '<F8>'
" let g:floaterm_keymap_hide   = '<F5>'
" let g:floaterm_keymap_show   = '<F6>'
let g:floaterm_keymap_kill   = '<F3>'
" let g:floaterm_keymap_toggle = '<F4>'

augroup FloatermCustomizations
    autocmd!
    autocmd User PlugLoaded ++nested highlight FloatermBorder guibg=darkblue
augroup end
