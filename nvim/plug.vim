call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'preservim/nerdcommenter'
Plug 'flatcap/vim-local'
Plug 'tpope/vim-commentary'

if has("nvim")
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  if has("mac")
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'hrsh7th/cmp-emoji'
  endif

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/trouble.nvim'

  " cmp
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  
  " snippets
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  "Plug 'ludovicchabant/vim-gutentags'
  Plug 'ThePrimeagen/harpoon'
  " themes
  "Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  "Plug 'ellisonleao/gruvbox.nvim'
  Plug 'sainnhe/everforest'

  " other
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'phaazon/hop.nvim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'akinsho/bufferline.nvim'
  Plug 'windwp/nvim-autopairs'

else
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'gruvbox-community/gruvbox'
endif
call plug#end()
