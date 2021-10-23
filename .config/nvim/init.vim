source ~/.vimrc
" Imports
runtime ./mappings.vim
runtime ./plug.vim

language en_US

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" gruvbox
colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"
" status line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
