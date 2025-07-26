return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      -- Treesitter configuration will go here
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
}
