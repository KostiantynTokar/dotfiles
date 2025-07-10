Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline  --bind "alt-a:select-all,alt-d:deselect-all"'
let g:fzf_vim = {}
let g:fzf_vim.commits_log_options = '--graph --oneline --color=always'
let g:fzf_vim.files_options = ['--layout=reverse', '--info=inline', '--bind=alt-a:select-all,alt-d:deselect-all']
let g:fzf_vim.commits_options = ['--layout=reverse', '--info=inline']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <C-p> :Files<CR>

" Customize the Files command to use rg which respects .gitignore files.
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files.
" command! -bang -nargs=? -complete=dir AllFiles
"     \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': ['--multi', '--layout=reverse', '--bind=ctrl-a:select-all+accept']
\ }))
