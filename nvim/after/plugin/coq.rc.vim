" settigns
let g:coq_settings = { 'clients.tree_sitter.enabled': v:false }

lua << EOF

require("coq")

EOF

nnoremap <leader>c <cmd>COQnow --shut-up<cr>

au VimEnter * :COQnow
