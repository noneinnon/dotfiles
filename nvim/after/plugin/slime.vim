" https://github.com/jpalardy/vim-slime
"
let g:slime_target = "tmux"
let g:slime_paste_file = expand("$HOME/.slime_paste")
" or maybe...
" let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
