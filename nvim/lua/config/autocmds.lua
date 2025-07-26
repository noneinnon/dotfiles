local makeprg_group = vim.api.nvim_create_augroup("makeprg", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact"
    },
    callback = function()
        vim.cmd('setlocal makeprg=bun')
        vim.cmd('setlocal errorformat=%f:%l:%c') end,
    group = makeprg_group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
        vim.cmd('setlocal makeprg=sh')
        vim.cmd('setlocal errorformat=%f:%l:%c')
    end,
    group = makeprg_group
})

local on_start_group = vim.api.nvim_create_augroup("on_start_group", { clear = true })



-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.cmd [[cd %:p:h]]
--     end,
--     group = on_start_group
-- })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "help" },
    command = [[wincmd L]]
})

-- use "q" to close file by type
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo", "netrw", "oil" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.cmd [[LspStop]]
    end,
    -- group = on_start_group
})


