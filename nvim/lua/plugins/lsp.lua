return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      -- Load global diagnostic keymaps and configuration
      require('lsp.keymaps')
      
      -- Get our modular components
      local servers = require('lsp.servers')
      local on_attach = require('lsp.on_attach')
      local capabilities = require('util.lsp').capabilities
      
      -- Setup Mason
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
      }
      
      -- Setup each server manually (compatible with all versions)
      for server_name, server_config in pairs(servers) do
        require('lspconfig')[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = server_config.settings,
        }
      end
    end,
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
