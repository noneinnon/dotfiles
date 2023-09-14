" https://github.com/jpalardy/vim-slime
"
let g:slime_target = "tmux"
let g:slime_paste_file = expand("$HOME/.slime_paste")
" or maybe...
" let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1

xmap <c-/><c-/> <Plug>SlimeRegionSend
nnoremap <c-/><c-/> <Plug>SlimeParagraphSend
nnoremap <c-/>v     <Plug>SlimeConfig
