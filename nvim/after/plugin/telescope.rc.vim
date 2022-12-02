if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <silent> ;F <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> ;o <cmd>Telescope oldfiles<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep theme=dropdown<cr>
nnoremap <silent> ;R <cmd>Telescope grep_string<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;h <cmd>Telescope help_tags<cr>
nnoremap <silent> ;d <cmd>Telescope lsp_definitions<cr>
nnoremap <silent> ;e <cmd>Telescope lsp_document_diagnostics<cr>
"nnoremap <silent> ;t <cmd>Telescope lsp_type_definitions<cr>
nnoremap <silent> ;t <cmd>Telescope treesitter<cr>
"nnoremap <silent> ;a <cmd>Telescope lsp_code_actions<cr>
nnoremap <silent> gr <cmd>Telescope lsp_references<cr>
nnoremap <silent> ;s <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent> ;S <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <silent> ;m <cmd>Telescope marks<cr>
nnoremap <silent> ;c <cmd>Telescope commands<cr>
nnoremap <silent> ;k <cmd>Telescope keymaps<cr>
nnoremap <silent> ;T <cmd>Telescope tags<cr>
nnoremap <silent> <C-q> <cmd>Telescope quickfix<cr>
nnoremap <silent> ;; <cmd>Telescope file_browser path=%:p:h<cr>

"nnoremap <silent> <C-f> <cmd>lua require('telescope.builtin').file_browser( { cwd = vim.fn.expand('%:p:h') })<cr>

lua << EOF
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    --preview = true,
    initial_mode = "normal",
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-Q>"] = actions.send_to_qflist,
        ["<C-q>"] = actions.send_selected_to_qflist,
        },
      i = { 
        ["<C-Q>"] = actions.send_to_qflist,
        ["<C-q>"] = actions.send_selected_to_qflist,
      },
    },
  },
  file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
  }

require("telescope").load_extension "file_browser"
EOF
