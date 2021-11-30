call plug#begin()
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug 'sheerun/vim-polyglot'
"Plug 'prettier/vim-prettier'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'gruvbox-community/gruvbox'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'w0rp/ale'
Plug 'flatcap/vim-local'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
"Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'folke/trouble.nvim'

if has("nvim")

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'kyazdani42/nvim-web-devicons'
endif
call plug#end()
