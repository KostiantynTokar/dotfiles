" File system explorer.
" For help :NERDTree and then ? or :help NERDTree.
Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▽'

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

let g:plug_window='noautocmd vertical topleft new'
