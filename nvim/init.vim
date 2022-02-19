source ~/.vimrc

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set noswapfile


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

"highlight Normal   ctermbg=NONE guibg=none
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

syntax on

" adds searching of the current directory for the .vimrc file and loads it.
set exrc
" ensures that shell, autocmd and write commands are not allowed in the .vimrc file that was found in the current directory as there’s no need to take risks
set secure

set nohlsearch
"set hidden
set noswapfile

set wildignore+=**/node_modules/**

" disable auto comments on new line
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" relative line
":set relativenumber
":set rnu

"set wildmenu

" Idents
"set expandtab
"set shiftwidth=2
"set autoindent
"set smartindent

silent! so .vimlocal

" Fundamentals "{{{
" ---------------------------------------------------------------------

"
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
"set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" removes commenting next line, after inserting a new line next to a commented
" one
set formatoptions-=cro

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

" constant room for sign columns
set signcolumn=yes

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
"set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./mappings.vim
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  set termguicolors
  "set winblend=0
  "set wildoptions=pum
  "set pumblend=5

  " Use NeoSolarized
  "let g:neosolarized_termtrans=1
  "runtime ./colors/NeoSolarized.vim
  "colorscheme NeoSolarized
  " gruvbox
  "set background=dark
  colorscheme gruvbox
 "let g:nord_underline_option = 'none'
  "let g:nord_italic = v:true
  "let g:nord_italic_comments = v:false
  "let g:nord_minimal_mode = v:false
  "let g:nord_alternate_backgrounds = v:false
  set background=light
  "colorscheme nordic
  "
  "colorscheme melange
  endif

"}}}


" debug
function! PerformanceLogStart()
  :profile start profile.log
  :profile func *
  :profile file *
endfunction

function! PerformanceLogStop()
  :profile pause
  :noautocmd qall!
endfunction
