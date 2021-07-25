set nocompatible

syntax enable
filetype plugin on

set number
set relativenumber
set showcmd

set splitright
set splitbelow

" <leader> by default is a '\'
" Creates empty line below and above of current line
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Search down into subfolders
" Provides tab-complition for all file-related tasks
set path+=**

" Display all matching files when tab comlete
" Choose with tab and alt+tab
set wildmenu

" :b lets you autocomlete any open buffer

" Autocomplete highlights
" ^x^n for just this file
" ^x^f for filenames
" ^x^] for tags only (see ctags program)
" ^n for anything specified by the 'complete' option
" In search menu: ^n to next, ^p to previous

" File browsing
let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" :edit a folder to open a file browser
" <CR>/v/t to open in an h-split/vsplit/tab
" check |netrw-browse-maps| for more mappings

