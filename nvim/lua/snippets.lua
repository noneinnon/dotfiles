local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

-- common snippets for JS / TS
local commonSnippets = {
  -- use 'cl' of friendly snippets instead
  --s("log", {
    --t("console.log("),
    --i(0),
    --t(")")
  --}),
  ls.parser.parse_snippet('imr', "import React from 'react';\n"),
  ls.parser.parse_snippet('selina atoms', "import styled from 'styled-components/macro';\n"),
  ls.parser.parse_snippet('jsdoc', "/**\n  * $0\n*/"),
  s("param", 
    fmt("@param {{{1}}} {{{2}}} - {{{3}}}", 
      {i(1, 'type'), i(2, 'varname'), i(3, 'description')}
    )
  ),
  s("return",
    fmt("@return {{{1}}} - {{{2}}}",
      {i(1, 'type'), i(2, 'description')}
    )
  )
}

ls.add_snippets("javascript", commonSnippets)
ls.add_snippets("typescript", commonSnippets)
ls.add_snippets("typescriptreact", commonSnippets)
ls.add_snippets("javascriptreact", commonSnippets)

-- for _, file_type in ipairs(file_types) do
--   ls.add_snippets(file_type, commonSnippets)
-- end
