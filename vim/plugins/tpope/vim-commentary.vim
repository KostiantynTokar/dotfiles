" Toggle comments.
" Use gcc to comment out a line (takes a count),
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph),
" gc in visual mode to comment out the selection,
" and gc in operator pending mode to target a comment.
" gcgc uncomments a set of adjacent commented lines.
" You can also use it as a command, either with a range like :7,17Commentary, or as part of a
" :global invocation like with :g/pattern/Commentary.
Plug 'tpope/vim-commentary'
