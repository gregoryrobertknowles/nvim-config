return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    -- friendly-snippets (VSCode-style)
    require("luasnip.loaders.from_vscode").lazy_load()
    -- your own Lua snippets in lua/snippets/<filetype>.lua
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets",
    })
  end,
}
