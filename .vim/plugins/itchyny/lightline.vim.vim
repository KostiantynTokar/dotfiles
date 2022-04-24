" Statusline.
Plug 'itchyny/lightline.vim'

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             ['fugitive', 'readonly', 'filename', 'modified' ] ],
    \ },
    \ 'component_function': {
    \   'filetype': 'LightlineFiletype',
    \   'fileformat': 'LightlineFileformat',
    \   'fugitive': 'FugitiveHead',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }

function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

set noshowmode " Mode is displayed in lightline.

if !has('gui_running') " Enable colors for lightline
    set t_Co=256
endif
