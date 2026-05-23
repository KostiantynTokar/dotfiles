Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \ "src/**/*.cpp":   { "alternate": "include/{dirname}/{basename}.h" },
    \ "include/**/*.h": { "alternate": "src/{dirname}/{basename}.cpp" },
    \ }
