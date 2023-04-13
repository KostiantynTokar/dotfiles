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
set signcolumn=yes
set number
set relativenumber
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
set showcmd
set termguicolors
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
set backup
set backupdir=~/.vim/bak//,.
if !isdirectory($HOME . "/.vim/bak")
    execute '!mkdir -p $HOME/.vim/bak'
endif
set undofile
set undodir=$HOME/.vim/undo
if !isdirectory($HOME . "/.vim/undo")
    execute '!mkdir -p $HOME/.vim/undo'
endif
set directory^=$HOME/.vim/swp//
if !isdirectory($HOME . "/.vim/swp")
    execute '!mkdir -p $HOME/.vim/swp'
endif
set cmdheight=2
set updatetime=300
set redrawtime=10000
set incsearch
set hlsearch
set shortmess+=c
set notimeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50
set nrformats+=alpha

set autoread
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

set laststatus=2 " Always show status line.

set formatoptions-=cro " Disable continuation of comments on next line.

if &term =~? 'rxvt' || &term =~? 'xterm' || &term =~? 'st-'
    " 0 or 1 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    " Insert Mode (and Replace Mode, since t_SR is not set)
    let &t_SI .= "\<Esc>[5 q"
    " Normal Mode
    let &t_EI .= "\<Esc>[5 q"
endif

set cino=(1s

" <leader> by default is a '\'
let mapleader="\<space>"

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

" Swtich buffers with leader+bb and leader+bB.
nnoremap  <silent> <leader>bb :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <leader>bB :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

map gf :edit <cfile><CR>

vnoremap < <gv
vnoremap > >gv

command! -nargs=+ -complete=command Redir new | put=execute('<args>') | 1,2d_ | :set buftype=nofile

command! -nargs=1 -complete=file PairNotebook execute ':silent !jupytext --set-formats ipynb,py:percent '.'<args>' | execute ':redraw!'
command! SyncNotebook execute ':w' | execute ':silent !jupytext --sync '.substitute(expand('%'), ".py$", ".ipynb", "") | execute ':redraw!'

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

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if (v:event.operator ==# 'y' && v:event.regname ==# 'w') | call system(s:clip, @w) | endif
    augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins that are installed by Vim-plug
" :PlugInstall to install plugins (need reload vim after this)
" :PlugUpdate to update plugins
" :PlugUpgrade to upgrade Vim-plug
" :PlugClean to delete plugins
call plug#begin('~/.vim/plugged')

source ~/.vim/plugins/chaoren/vim-wordmotion.vim
source ~/.vim/plugins/tpope/vim-commentary.vim
source ~/.vim/plugins/tpope/vim-repeat.vim
source ~/.vim/plugins/tpope/vim-surround.vim
source ~/.vim/plugins/tpope/vim-fugitive.vim
source ~/.vim/plugins/tpope/vim-unimpaired.vim
" source ~/.vim/plugins/tpope/vim-rojectionist.vim
source ~/.vim/plugins/kana/vim-textobj-user.vim
source ~/.vim/plugins/kana/vim-textobj-entire.vim
source ~/.vim/plugins/kana/vim-textobj-indent.vim
source ~/.vim/plugins/kana/vim-textobj-line.vim
source ~/.vim/plugins/jiangmiao/auto-pairs.vim
source ~/.vim/plugins/vim-scripts/ReplaceWithRegister.vim
source ~/.vim/plugins/christoomey/vim-sort-motion.vim
source ~/.vim/plugins/christoomey/vim-titlecase.vim
source ~/.vim/plugins/tommcdo/vim-exchange.vim
source ~/.vim/plugins/markonm/traces.vim.vim
source ~/.vim/plugins/preservim/nerdtree.vim
source ~/.vim/plugins/junegunn/vim-easy-align.vim
source ~/.vim/plugins/junegunn/fzf.vim.vim
if exepath("node") != ""
    source ~/.vim/plugins/neoclide/coc.nvim.vim
endif
source ~/.vim/plugins/mengelbrecht/lightline-bufferline.vim
source ~/.vim/plugins/itchyny/lightline.vim.vim
source ~/.vim/plugins/airblade/vim-current-search-match.vim
source ~/.vim/plugins/editorconfig/editorconfig-vim.vim
source ~/.vim/plugins/dracula/vim.vim
source ~/.vim/plugins/voldikss/vim-floaterm.vim
source ~/.vim/plugins/arp242/auto_mkdir2.vim
source ~/.vim/plugins/bfrg/vim-cpp-modern.vim

call plug#end()
doautocmd User PlugLoaded
