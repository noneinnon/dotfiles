" settigns
"let g:coq_settings = { 'auto_start': 'shut-up' }
let g:coq_settings = { 'auto_start': v:true }

lua << EOF
require("coq").settings = {
  auto_start = true
}
EOF

nnoremap <leader>c <cmd>COQnow --shut-up<cr>
