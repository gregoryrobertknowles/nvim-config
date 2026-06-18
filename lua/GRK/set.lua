-- Enable line numbers
vim.o.number = true

-- Enable relative line numbers
vim.o.relativenumber = true

--this is required to make NVim tree respect the opacity rules, not exactly sure how it works
--src:ChatGPT
local function apply_transparent_highlights()
  vim.cmd([[
    highlight Normal guibg=none ctermbg=none
    highlight NormalNC guibg=none
    highlight NvimTreeNormal guibg=none
    highlight NvimTreeNormalNC guibg=none
    highlight NvimTreeEndOfBuffer guibg=none
    highlight TroubleNormal guibg=NONE
    highlight TroubleNormalNC guibg=NONE

    highlight NormalFloat guibg=NONE
    highlight FloatBorder guibg=NONE
  ]])
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",
  callback = apply_transparent_highlights,
})

vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "redrawtabline",
})
vim.opt.showtabline = 2
vim.opt.winbar = nil

vim.opt.expandtab = true -- use spaces
vim.opt.shiftwidth = 2 -- indent width
vim.opt.tabstop = 2 -- tab width
vim.o.clipboard = "unnamedplus"

-- Folding (indent-based, open by default)
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true -- folds active, but...
vim.opt.foldlevelstart = 99 -- ...start fully unfolded
