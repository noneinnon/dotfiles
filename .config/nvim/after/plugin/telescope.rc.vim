if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;o <cmd>Telescope oldfiles<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> ;d <cmd>Telescope lsp_definitions<cr>
nnoremap <silent> ;e <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <silent> ;t <cmd>Telescope lsp_type_definitions<cr>
nnoremap <silent> ;a <cmd>Telescope lsp_code_actions<cr>
nnoremap <silent> gr <cmd>Telescope lsp_references<cr>
nnoremap <silent> ;s <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent> ;S <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <silent> ;m <cmd>Telescope marks<cr>
nnoremap <silent> <C-t> <cmd>Telescope file_browser<cr>
nnoremap <silent> <C-q> <cmd>Telescope quickfix<cr>

"nnoremap <silent> <C-f> <cmd>lua require('telescope.builtin').file_browser( { cwd = vim.fn.expand('%:p:h') })<cr>


lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    },
  defaults = {
    preview = false,
    initial_mode = "normal",
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('fzf')
EOF
