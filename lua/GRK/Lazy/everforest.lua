return {
  "sainnhe/everforest",
  priority = 1000,   -- load early
  lazy = false,      -- load immediately
  config = function()
	  vim.o.background = "dark"

-- Set contrast: "soft", "medium", "hard"
vim.g.everforest_background = "soft"

-- Optional: better performance
vim.g.everforest_better_performance = 1
-- Load the colorscheme
vim.cmd("colorscheme everforest")

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  " nvim-tree specific
  highlight NvimTreeNormal guibg=none
  highlight NvimTreeNormalNC guibg=none
  highlight NvimTreeEndOfBuffer guibg=none
  highlight NvimTreeVertSplit guibg=none
]]
  end,
}
