""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vim-plug on vim startup if it doesn't exist.
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

set nocompatible

syntax enable
filetype plugin on

set encoding=UTF-8
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=number
set number
set relativenumber
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
set showcmd
set termguicolors
set undofile
" set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:►\ ,trail:·
set mouse=a
set scrolloff=16
set sidescrolloff=16
set nojoinspaces
set splitright
set splitbelow
" set clipboard=unnamedplus
set confirm
set exrc
" set backup
" set backupdir=~/.vim/tmp//,.
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set redrawtime=10000
set hlsearch
set shortmess+=c
set notimeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50

set laststatus=2 " Always show status line.

set formatoptions-=cro " Disable continuation of comments on next line.

" <leader> by default is a '\'
let mapleader=";"

nmap <leader>sc :nohlsearch<CR>
nmap <leader>bd :bufdo bdelete<CR>

" Creates empty line below and above of current line.
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>j
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>k

" Open new buffer in horizontal split: <C-w>n or :new.
" Open new buffer in horizontal split: :vnew. But <C-w>v opens existing buffer
" in horizontal split.

" Creates new buffer in vertical split.
nnoremap <leader>v :vnew<CR>

" Swtich buffers with leader+tab and leader+shift+tab.
nnoremap  <silent> <leader>bn :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <leader>bp :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

map gf :edit <cfile><CR>

vnoremap < <gv
vnoremap > >gv

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
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" :edit a folder to open a file browser
" <CR>/v/t to open in an h-split/vsplit/tab
" check |netrw-browse-maps| for more mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins that are installed by Vim-plug
" :PlugInstall to install plugins (need reload vim after this)
" :PlugUpdate to update plugins
" :PlugUpgrade to upgrade Vim-plug
" :PlugClean to delete plugins
call plug#begin('~/.vim/plugged')

source ~/.vim/plugins/tpope/vim-commentary.vim
source ~/.vim/plugins/tpope/vim-repeat.vim
source ~/.vim/plugins/tpope/vim-surround.vim
source ~/.vim/plugins/tpope/vim-fugitive.vim
source ~/.vim/plugins/kana/vim-textobj-user.vim
source ~/.vim/plugins/kana/vim-textobj-entire.vim
source ~/.vim/plugins/kana/vim-textobj-indent.vim
source ~/.vim/plugins/kana/vim-textobj-line.vim
source ~/.vim/plugins/vim-scripts/ReplaceWithRegister.vim
source ~/.vim/plugins/christoomey/vim-sort-motion.vim
source ~/.vim/plugins/christoomey/vim-system-copy.vim
source ~/.vim/plugins/christoomey/vim-titlecase.vim
source ~/.vim/plugins/markonm/traces.vim.vim
source ~/.vim/plugins/preservim/nerdtree.vim
if exepath("node") != ""
    source ~/.vim/plugins/neoclide/coc.nvim.vim
endif
source ~/.vim/plugins/mengelbrecht/lightline-bufferline.vim
source ~/.vim/plugins/itchyny/lightline.vim.vim
source ~/.vim/plugins/airblade/vim-current-search-match.vim
source ~/.vim/plugins/editorconfig/editorconfig-vim.vim
source ~/.vim/plugins/dracula/vim.vim
source ~/.vim/plugins/voldikss/vim-floaterm.vim
source ~/.vim/plugins/junegunn/fzf.vim.vim
source ~/.vim/plugins/arp242/auto_mkdir2.vim

call plug#end()
doautocmd User PlugLoaded
