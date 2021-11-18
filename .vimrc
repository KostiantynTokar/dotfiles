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

set number
set relativenumber
set showcmd

set laststatus=2 " Always show status line.

set splitright
set splitbelow

set formatoptions-=cro " Disable continuation of comments on next line.

" <leader> by default is a '\'
" Creates empty line below and above of current line.
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Open new buffer in horizontal split: <C-w>n or :new.
" Open new buffer in horizontal split: :vnew. But <C-w>v opens existing buffer
" in horizontal split.

" Creates new buffer in vertical split.
nnoremap <leader>v :vnew<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins that are installed by Vim-plug
" :PlugInstall to install plugins (need reload vim after this)
" :PlugUpdate to update plugins
" :PlugUpgrade to upgrade Vim-plug
" :PlugClean to delete plugins
call plug#begin('~/.vim/plugged')

" Toggle comments.
" Use gcc to comment out a line (takes a count),
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph),
" gc in visual mode to comment out the selection,
" and gc in operator pending mode to target a comment.
" gcgc uncomments a set of adjacent commented lines.
" You can also use it as a command, either with a range like :7,17Commentary, or as part of a
" :global invocation like with :g/pattern/Commentary.
Plug 'tpope/vim-commentary'

" Repeat with . with commands from some plugins.
Plug 'tpope/vim-repeat'

" New object - s<char> for surround, where char is ', \", (, [, {, <tag>, t (for html tag).
" Use closing brackets for surround with spaces.
" y<object>s<char> to create, cs<char><char> to change, ds<char> to delete surround.
" ss<char> means whole line.
Plug 'tpope/vim-surround'

" Dependency of the following plugins for new objects.
Plug 'kana/vim-textobj-user'
" ae - entire buffer, ie - entire buffer without leading and trailing empty lines.
Plug 'kana/vim-textobj-entire'
" ai, ii, aI, iI.
Plug 'kana/vim-textobj-indent'
" al - entire line, il - entire line without leading and trailing whitespaces.
Plug 'kana/vim-textobj-line'

" [count]["x]gr{motion}   Replace {motion} text with the contents of register x.
"                         Especially when using the unnamed register, this is
"                         quicker than \"_d{motion}P or \"_c{motion}<C-R>\"
" [count]["x]grr          Replace [count] lines with the contents of register x.
"                         To replace from the cursor position to the end of the
"                         line use ["x]gr$
" {Visual}["x]gr          Replace the selection with the contents of register x.
Plug 'vim-scripts/ReplaceWithRegister'

" gc<motion> to sort lines.
" If motion is inside the line, command will attemptr to sort it as comma-separated list.
" For example, gsi( - sort inside parenthesis.
Plug 'christoomey/vim-sort-motion'

" cp<motion> for copying and cv<motion> for pasting to system clipboard. cP and CV for whole line.
" cpiw - copy inside word
" cpi' - copy inside single quotes
" cvi' - paste inside single quotes
Plug 'christoomey/vim-system-copy'

" The gt mapping will wait for a text object or motion before completing the titlecase operation.
" This means gti' will titlecase inside of single quotes, gtap will titlecase a paragraph, etc.
" gt will also work on a visual selection.
" gT will titlecase the current line.
Plug 'christoomey/vim-titlecase'

" Highlights patterns and ranges for Ex commands in Command-line mode. It also provides live preview for :substitute.
Plug 'markonm/traces.vim'

" File system explorer.
" For help :NERDTree and then ? or :help NERDTree.
Plug 'preservim/nerdtree'

" Statusline.
Plug 'itchyny/lightline.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins-related settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

set noshowmode " Mode is displayed in lightline.

if !has('gui_running') " Enable colors for lightline
	set t_Co=256
endif

