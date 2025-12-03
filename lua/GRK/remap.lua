vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>v", function()
  local init_path = vim.fn.expand("$MYVIMRC")
  local init_dir = vim.fn.fnamemodify(init_path, ":h")

  -- Open init.lua
  vim.cmd("edit " .. init_path)

  -- Set nvim-tree root and reveal init.lua
  require("nvim-tree.api").tree.open()
  require("nvim-tree.api").tree.change_root(init_dir)
  require("nvim-tree.api").tree.find_file({ open = true, focus = true })
end, { desc = "Edit init.lua and reveal in nvim-tree" })

--Remap Leader E to toggle Nvim Tree
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file explorer" })

vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, {
    scope = "buffer",
    border = "rounded",
    source = "always",
  })
end, { desc = "Show all diagnostics" })
