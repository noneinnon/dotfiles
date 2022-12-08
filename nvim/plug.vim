call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'preservim/nerdcommenter'
Plug 'flatcap/vim-local'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

if has("nvim")
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  if has("mac")
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'hrsh7th/cmp-emoji'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
  endif

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  " Plug 'folke/trouble.nvim'

  " cmp
  " Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'kyazdani42/nvim-tree.lua'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-copilot'
  Plug 'github/copilot.vim'
  
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
  " Plug 'ellisonleao/gruvbox.nvim'
  " Plug 'sainnhe/everforest'
  Plug 'pgdouyon/vim-yin-yang'
  Plug 'sainnhe/edge'

  " other
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  " Plug 'phaazon/hop.nvim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " Plug 'akinsho/bufferline.nvim'
  Plug 'windwp/nvim-autopairs'
  " Clojure
  Plug 'Olical/conjure'
  Plug 'mhinz/vim-startify'
  Plug 'justinmk/vim-gtfo'


else
  " Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'gruvbox-community/gruvbox'
endif
call plug#end()
