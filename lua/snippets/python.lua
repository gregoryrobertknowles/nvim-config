-- abbreviations
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_noce
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

-- this will require linking to luasnip, as only friendly snippets aare linked presently.
--
--
ls.add_snippet({ "python", { s(
  "test_snip",
  fmt(
    [[
# this is a test snippet
  ]],
    { i(1, "name") }
  )
)
 } })
