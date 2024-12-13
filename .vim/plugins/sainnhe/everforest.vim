Plug 'sainnhe/everforest'

augroup EverforestOverrides
    autocmd!
    autocmd User PlugLoaded ++nested let g:everforest_background='soft'
    autocmd User PlugLoaded ++nested let g:everforest_better_performance=1
augroup end
