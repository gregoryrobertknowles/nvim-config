-- abbreviations
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "def_placeholder",
    fmt(
      [[
def {}({}):
    # TODO: {}
    raise NotImplementedError()
]],
      {
        i(1, "function_name"),
        i(2, "args"),
        i(3, "describe implementation"),
      }
    )
  ),
}
