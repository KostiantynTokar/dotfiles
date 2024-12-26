Plug 'ziglang/zig.vim'

" don't show parse errors in a separate window
" let g:zig_fmt_parse_errors = 0
" disable format-on-save from `ziglang/zig.vim`
" let g:zig_fmt_autosave = 0

autocmd BufWritePre *.zig,*.zon call CocActionAsync('fixAll')
autocmd BufWritePre *.zig,*.zon call CocActionAsync('organizeImport')
