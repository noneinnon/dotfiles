local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require'snippets'

ls.filetype_extend('typescriptreact', {'javascriptreact'})
ls.filetype_extend('typescript', {'javascript'})
ls.filetype_extend('javascript', {'html'})
