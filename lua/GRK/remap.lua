vim.g.mapleader = " "

--Remap Leader E to toggle Nvim Tree
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file explorer" })

vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float(nil, {
    scope = "buffer",
    border = "rounded",
    source = "always",
  })
end, { desc = "Show all diagnostics" })
