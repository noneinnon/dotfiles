-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

  nmap('<leader>lf', ':Format<CR>', '[L]SP format [B]uffer')
end


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>,e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>,q', vim.diagnostic.setloclist)
-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- NOTICE https://github.com/williamboman/mason-lspconfig.nvim
local servers = {
  'html',
  'ts_ls',
  'lua_ls',
  -- 'gopls',
  'clojure_lsp',
  'diagnosticls',
  'eslint',
  'terraformls',
  -- 'eslint_d',
  -- 'tailwindcss'
}

local lspconfig = require 'lspconfig'

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require 'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'handlebars' }
}

require 'lspconfig'.astro.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'astro' }
}

require 'lspconfig'.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("resources/tailwind.config.js", "tailwind.config.js", ".git"),
  filetypes = { 'astro', 'javascriptreact', 'typescriptreact', 'clojure', 'html' },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      validate = true,
      experimental = {
        classRegex = {
          ":class\\s+\"([^\"]*)\"",
          ":[\\w-.#>]+\\.([\\w-]*)"
        },
      },
      includeLanguages = {
        clojure = "html"
      },
    }
  }
}


-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}


require 'lspconfig'.marksman.setup {}

-- https://github.com/neovim/nvim-lspconfig/issues/662
-- :help vim.lsp.diagnostic.on_publish_diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true -- false to disable helper text
  }
)
