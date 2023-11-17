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
        vim.cmd('setlocal errorformat=%f:%l:%c')
    end,
    group = makeprg_group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh"
    ,
    callback = function()
        vim.cmd('setlocal makeprg=sh')
        vim.cmd('setlocal errorformat=%f:%l:%c')
    end,
    group = makeprg_group
})
