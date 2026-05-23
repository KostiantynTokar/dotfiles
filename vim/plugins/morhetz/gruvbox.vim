Plug 'morhetz/gruvbox'

augroup GruvboxOverrides
    autocmd!
    autocmd User PlugLoaded ++nested let g:gruvbox_contrast_dark='hard'
    autocmd User PlugLoaded ++nested let g:gruvbox_contrast_light='medium'
augroup end
