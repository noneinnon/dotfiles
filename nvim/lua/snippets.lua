local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep

-- common snippets for JS / TS
local commonSnippets = {
  -- use 'cl' of friendly snippets instead
  --s("log", {
    --t("console.log("),
    --i(0),
    --t(")")
  --}),
  ls.parser.parse_snippet('imr', "import React from 'react';\n"),
  ls.parser.parse_snippet('selina atoms', "import styled from 'styled-components/macro';\n")
}

ls.add_snippets("javascript", commonSnippets)
ls.add_snippets("typescript", commonSnippets)
ls.add_snippets("typescriptreact", commonSnippets)
ls.add_snippets("javascriptreact", commonSnippets)
