vim.g["conjure#client#clojure#nrepl#mapping#session_fresh"]= 'csf'
vim.g["conjure#client#clojure#nrepl#mapping#session_select"]= 'css'
vim.keymap.set('', '<leader>csc', ':ConjureCljSessionClone<CR>', { silent = true })
vim.keymap.set('', '<leader>csa', ':ConjureShadowSelect ', { silent = true })
