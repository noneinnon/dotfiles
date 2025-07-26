return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {
      -- LSP configuration will go here
    },
  },
  {
    'williamboman/mason.nvim',
    cmd = "Mason",
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {},
  },
}
