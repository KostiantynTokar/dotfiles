" Statusline.
Plug 'itchyny/lightline.vim'

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

set noshowmode " Mode is displayed in lightline.

if !has('gui_running') " Enable colors for lightline
    set t_Co=256
endif
