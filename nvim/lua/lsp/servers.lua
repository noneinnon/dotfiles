-- LSP server configurations
-- Each server can have custom settings, or use {} for defaults

return {
  -- TypeScript/JavaScript (note: server names may need verification)
  -- Try ts_ls first, fallback to alternatives if needed
  ts_ls = {
    filetypes = { "typescript", "javascript" },
  },
  
  -- Alternative TypeScript server (if ts_ls doesn't work)
  -- vtsls = {},
  
  -- Terraform
  terraformls = {
    filetypes = { "terraform" },
  },
  
  -- Clojure
  clojure_lsp = {
    filetypes = { "clojure" },
  },
  
  -- Markdown
  marksman = {
    filetypes = { "md", "markdown" },
  },
  -- Intellephse
  -- intelephense = {},
  phpactor = {
    filetypes = { "php", "blade" },
  },
  -- phpstan = {
  --   filetypes = { "php", "blade"  },
  -- },
  psalm = {
    filetypes = { "php", "blade"  },
  },
  
  -- Lua with custom settings for Neovim development
  lua_ls = {
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
