local M = {}

-- Get capabilities from nvim-cmp
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
M.capabilities = ok and cmp_nvim_lsp.default_capabilities()
                 or vim.lsp.protocol.make_client_capabilities()

-- Modern format function
function M.format(bufnr)
  vim.lsp.buf.format { async = true, bufnr = bufnr or 0 }
end

return M
