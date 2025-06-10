-- Enable line numbers
vim.o.number = true

-- Enable relative line numbers
vim.o.relativenumber = true

--this is required to make NVim tree respect the opacity rules, not exactly sure how it works
--src:ChatGPT
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=none ctermbg=none
      highlight NormalNC guibg=none
      highlight NvimTreeNormal guibg=none
      highlight NvimTreeNormalNC guibg=none
      highlight NvimTreeEndOfBuffer guibg=none 
    ]])
  end,
})

vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "redrawtabline",
})
vim.opt.showtabline = 2
vim.api.nvim_create_autocmd("TabEnter", {
  pattern = "*",
  command = "redraw!",
})
vim.opt.winbar = nil
