" Quickfix
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :close<CR>



" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" General Mappings
let mapleader = "\<Space>"

" quickfix
nnoremap ;h :cprev<CR>
nnoremap ;l :cnext<CR>

" Substitute
"
" replace word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" replace in visual
vnoremap <leader>0 :s/\%V\<<c-r>0\>//g<left><left>

" Substitute in quickfix
nnoremap <leader>cd :cdo %s///gc <bar> update<c-b><right><right><right><right><right><right><right>

nnoremap <leader>- :vimgrep <C-r><C-w> % <bar>:copen<CR>

"" For local replace
"nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
"nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>Ff :FZF -q <C-r><C-w><CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Rg<CR>
nnoremap <leader>Fc :Rg <C-r><C-w><CR>
nnoremap <leader>fh :History<CR>

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
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

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

" tabs
" previous
map <leader>{ :tabp<CR>
" next
map <leader>} :tabn<CR>
" close
map <leader>w :tabc<CR>
" new
map <leader>n :tabnew<CR>

" No highlight
nmap <leader>\ :noh<CR>

" ETC
" create component in directory of current opened buffer

" web-crm
"function! GetBranchName()
  "let name = system('git symbolic-ref --short HEAD')
  "let trimmed = substitute(name, '\n$', '', 'g')
  "return '[' . trimmed . ']' . ' '
"endfunction

nnoremap <leader>1 :cd %:p:h <bar> !npm run create  <left>
nnoremap <leader>2 "=GetBranchName()<CR>pi<space>

" Buffers
nnoremap <leader>B :Buffers<CR>
nnoremap <leader><leader>d :bd<CR>
" close all buffers
nnoremap <leader>bd :1, $bd!<CR>

" source
nnoremap <leader>0 :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>9 :e ~/.config<CR>
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
