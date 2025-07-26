-- LSP server configurations
-- Each server can have custom settings, or use {} for defaults

return {
  -- TypeScript/JavaScript (note: server names may need verification)
  -- Try ts_ls first, fallback to alternatives if needed
  ts_ls = {},
  
  -- Alternative TypeScript server (if ts_ls doesn't work)
  -- vtsls = {},
  
  -- Terraform
  terraformls = {},
  
  -- Clojure
  clojure_lsp = {},
  
  -- Markdown
  marksman = {},
  
  -- Lua with custom settings for Neovim development
  lua_ls = {
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
