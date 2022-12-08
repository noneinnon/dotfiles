" General Mappings
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" LSP
nnoremap <C-l> :LspStop<CR>
nnoremap <C-L> :LspStart<CR>
" Netrw
" nnoremap <C-f> :Explore<CR>
" disable command history
nnoremap q: <Nop>
"
" disable ex mode
nnoremap Q <Nop>

" Quickfix
nnoremap <leader>qfo :copen<CR>
nnoremap <leader>qfc :close<CR>

" quickfix
nnoremap ]q q:cnext<CR>
nnoremap [q :cprev<CR>

" Substitute
" replace word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" replace in visual
vnoremap <leader>s :s/\%V\<<C-r><C-w>\>/

" Substitute in quickfix
nnoremap <leader>cd :cdo %s///gc <bar> update<c-b><right><right><right><right><right><right><right>
nnoremap <leader>- :vimgrep <C-r><C-w> % <bar>:copen<CR>

" Fugitive
"nnoremap <leader>gs :tab Git<CR>
nnoremap <leader>gs :vertical G<CR>
"nnoremap <leader>gc :tab Git commit<CR>
nnoremap <leader>gc :vertical Git commit<CR>

nnoremap <leader>gp :Git push<CR>
nnoremap <leader>ggfl :Git push --force-with-lease<CR>
nnoremap <leader>gff :Git fetch<CR>
nnoremap <leader>gd :Gvdiff HEAD
nnoremap <leader>gdo :Gvdiff origin<CR>
nnoremap <leader>gdm :Gvdiff origin/master<CR>
nnoremap <leader>gdc :Gvdiff origin/"=! git rev-parse --abbrev-ref HEAD"<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gm :Git checkout master<CR>
nnoremap <leader>g- :Git checkout
nnoremap <leader>grm :Git rebase -i origin/master<CR>

nnoremap <leader>gl :vertical Git log<CR>
nnoremap <leader>gL :Gclog<CR>

" Fugitive mappings https://gist.github.com/mikaelz/38600d22b716b39b031165cd6d201a67
nnoremap <leader>< :diffget //2<CR>
nnoremap <leader>> :diffget //3<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffpush<CR>

" Nerd Commenter
" map <leader>ct :NERDCommenterToggle<CR>

" Windows & panes
function! WinMove(key)
  let t:cuwin = winnr()
  exec "wincmd "a:key
  if (t:cuwin == winnr())
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

nmap <silent> <leader>h :call WinMove('h')<CR>
nmap <silent> <leader>j :call WinMove('j')<CR>
nmap <silent> <leader>k :call WinMove('k')<CR>
nmap <silent> <leader>l :call WinMove('l')<CR>

nnoremap <S-l> <C-w>>
nnoremap <S-h> <C-w><
nnoremap <S-j> <C-w>-
nnoremap <S-k> <C-w>+

" Buffers
" close single buffer
nnoremap <leader>bd :bd<CR>
" close all buffers
nnoremap <leader>Bd :%bdelete<CR>

" Source
nnoremap <leader>0 :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>9 :e ~/.config<CR>
nnoremap <leader>8 :so %

" Clipboard
noremap <C-c> "*y
noremap <C-p> "*p

" ETC
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :wq<CR>

" kudos to ThePrimeagen
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac") || has("nvim") || has("neovim")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif
