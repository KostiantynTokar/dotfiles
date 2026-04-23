Plug 'sainnhe/sonokai'

augroup SonokaiOverrides
    autocmd!
    " autocmd User PlugLoaded ++nested let g:sonokai_style='default'
    " autocmd User PlugLoaded ++nested let g:sonokai_style='atlantis'
    autocmd User PlugLoaded ++nested let g:sonokai_style='andromeda'
    " autocmd User PlugLoaded ++nested let g:sonokai_style='shusia'
    " autocmd User PlugLoaded ++nested let g:sonokai_style='maia'
    " autocmd User PlugLoaded ++nested let g:sonokai_style='espresso'
    autocmd User PlugLoaded ++nested let g:sonokai_better_performance=1
augroup end
