Plug 'itchyny/lightline.vim'

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'fugitive', 'cocstatus', 'coccurrentfunction' ],
    \           ],
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ], ],
    \   'right': [ [ 'tabs' ], ],
    \ },
    \ 'component_function': {
    \   'filetype': 'LightlineFiletype',
    \   'fileformat': 'LightlineFileformat',
    \   'fugitive': 'FugitiveHead',
    \   'cocstatus': 'coc#status',
    \   'coccurrentfunction': 'LightlineCurrentFunction',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
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

function! LightlineCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set noshowmode " Mode is displayed in lightline.

if !has('gui_running') " Enable colors for lightline
    set t_Co=256
endif

function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

function! LightlineResetColorscheme(new_colorscheme)
    let g:lightline.colorscheme=a:new_colorscheme
    call LightlineReload()
endfunction

augroup LightlineColorschemeOverrides
    autocmd!
    autocmd ColorScheme * call LightlineResetColorscheme(expand("<amatch>"))
augroup end
