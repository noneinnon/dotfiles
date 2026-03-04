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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fish",
    callback = function()
        vim.cmd('setlocal makeprg=fish')
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

-- vim.api.nvim_create_autocmd('VimEnter', {
--     callback = function()
--         vim.cmd [[LspStop]]
--     end,
--     -- group = on_start_group
-- })

vim.api.nvim_create_user_command('Tinker', function()
    vim.cmd [[terminal php artisan tinker]]
end, {})


function SendToTinker()
    local start_line, start_col = vim.fn.getpos("'<")[1], vim.fn.getpos("'<")[2]
    local end_line, end_col = vim.fn.getpos("'>")[1], vim.fn.getpos("'>")[2]
    local lines = vim.fn.getline(start_line, end_line)
    local text = table.concat(lines, "\n")

    -- Remove trailing newline if present
    if #lines > 1 and lines[#lines] == "" then
        text = text:sub(1, -2)
    end
    local cmd = string.format("!php artisan tinker << \"%s\"", text:gsub('"', '\\"'))
    vim.cmd(cmd)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false      -- Use real tabs
        vim.opt_local.tabstop = 8            -- Display tabs as 8 spaces wide
        vim.opt_local.shiftwidth = 8         -- Indent with 8 spaces worth
        vim.opt_local.softtabstop = 0        -- Don't mix tabs and spaces
        -- Optional: Show tabs vs spaces visually
        vim.opt_local.list = true
        vim.opt_local.listchars = { tab = '→ ', trail = '·' }
    end,
    group = vim.api.nvim_create_augroup("makefile_settings", { clear = true })
})

vim.api.nvim_create_user_command('SendToTinker', SendToTinker, {})
