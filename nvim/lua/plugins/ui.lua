return {
  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
      options = {
        theme = "zenbones"
      }
    },
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme zenbones]]
      vim.o.background = "dark"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  },
  {
    'folke/todo-comments.nvim',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  },
}
