local util = require('util.lsp')

local function nmap(bufnr, keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
end

return function(_, bufnr)
  -- Navigation and actions
  nmap(bufnr, 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap(bufnr, 'gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap(bufnr, 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap(bufnr, '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap(bufnr, 'K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap(bufnr, '<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
  
  -- Code actions
  nmap(bufnr, '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap(bufnr, '<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')
  nmap(bufnr, '<leader>lf', function() util.format(bufnr) end, 'Format [B]uffer')
  
  -- Workspace management
  nmap(bufnr, '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap(bufnr, '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap(bufnr, '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create Format command for this buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    util.format(bufnr)
  end, { desc = 'Format current buffer with LSP' })
end
