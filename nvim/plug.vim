call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'gruvbox-community/gruvbox'
Plug 'flatcap/vim-local'
Plug 'easymotion/vim-easymotion'

if has("nvim")

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  if has("mac")
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'hrsh7th/cmp-emoji'
  endif


  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'neovim/nvim-lspconfig'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'andersevenrud/nordic.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'savq/melange'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'ThePrimeagen/harpoon'
  "Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
endif
call plug#end()
