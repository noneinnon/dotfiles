if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;o <cmd>Telescope oldfiles<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> ;d <cmd>Telescope lsp_definitions<cr>
nnoremap <silent> ;e <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <silent> ;t <cmd>Telescope lsp_type_definitions<cr>
nnoremap <silent> <C-t> <cmd>Telescope file_browser<cr>
nnoremap <silent> <C-q> <cmd>Telescope quickfix<cr>

nnoremap <silent> <C-f> <cmd>lua require('telescope.builtin').file_browser( { cwd = vim.fn.expand('%:p:h') })<cr>


lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
