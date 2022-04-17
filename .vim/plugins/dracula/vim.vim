Plug 'dracula/vim', { 'as': 'dracula' }

" let g:dracula_colorterm=0
" let g:dracula_italic=0

augroup DraculaOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end
