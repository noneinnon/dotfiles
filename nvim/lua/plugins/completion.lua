return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-path',
      'ray-x/cmp-treesitter',
      'PaterJason/cmp-conjure',
    },
    opts = {
      -- nvim-cmp configuration will go here
    },
  },
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
}
