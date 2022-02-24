" General Mappings
let mapleader = "\<Space>"

" disable command history
nnoremap q: <Nop>
"
" disable ex mode
nnoremap Q <Nop>

" Quickfix
nnoremap <leader>qfo :copen<CR>
nnoremap <leader>qfc :close<CR>

" quickfix
nnoremap ;h :cprev<CR>
nnoremap ;l :cnext<CR>

" Substitute
"
" replace word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" replace in visual
vnoremap <leader>1 :s/\%V\<<c-r>0\>//g<left><left>

" Substitute in quickfix
nnoremap <leader>cd :cdo %s///gc <bar> update<c-b><right><right><right><right><right><right><right>

nnoremap <leader>- :vimgrep <C-r><C-w> % <bar>:copen<CR>

" Fugitive
nnoremap <leader>gs :tab Git<CR>
nnoremap <leader>gc :tab Git commit<CR>

nnoremap <leader>gp :Git push<CR>
nnoremap <leader>ggfl :Git push --force-with-lease<CR>
nnoremap <leader>gff :Git fetch<CR>
nnoremap <leader>gdo :Gvdiff origin<CR>
nnoremap <leader>gdm :Gvdiff origin/master<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gm :Git checkout master<CR>
nnoremap <leader>g- :Git checkout
nnoremap <leader>grm :Git rebase -i origin/master<CR>

nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gL :Gclog<CR>

" Fugitive mappings https://gist.github.com/mikaelz/38600d22b716b39b031165cd6d201a67
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //3<CR>
"
" Nerd Commenter
map <leader>ct :NERDCommenterToggle<CR>

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

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

nmap <S-h> <C-w>>
nmap <S-l> <C-w><
nmap <S-j> <C-w>+
nmap <S-k> <C-w>-

" Buffers
"
" close single buffer
nnoremap <leader><leader>d :bd<CR>
" close all buffers
nnoremap <leader>bd :1, $bd!<CR>

" Source
nnoremap <leader>0 :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>9 :e ~/.config<CR>

" ETC
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :wq<CR>

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
