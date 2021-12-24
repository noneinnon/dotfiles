call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'gruvbox-community/gruvbox'
Plug 'flatcap/vim-local'
Plug 'easymotion/vim-easymotion'
Plug 'folke/trouble.nvim'

if has("nvim")

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  Plug 'neovim/nvim-lspconfig'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq' }
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'kyazdani42/nvim-web-devicons'
  "Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
endif
call plug#end()
