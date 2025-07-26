return {
  {
    'tpope/vim-sleuth',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-sensible',
    event = "VeryLazy",
  },
  {
    'tpope/vim-surround',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-repeat',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-unimpaired',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-dotenv',
    ft = { "sh", "bash", "zsh", "fish" },
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- Telescope configuration will go here
    },
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    'stevearc/oil.nvim',
    cmd = "Oil",
    opts = {},
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      open_browser_app = "open",
      open_browser_args = {},
      handlers = {
        plugin = true,
        github = true,
        brewfile = true,
        package_json = true,
        search = true,
      },
      handler_options = {
        search_engine = "google",
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    event = "VeryLazy",
  },
}
