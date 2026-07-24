return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  cmd = "Telescope",
  keys = { "<leader>ff", "<leader>fg", "<C-p>", "<leader>pws", "<leader>pWs", "<leader>ps", "<leader>vh" },

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = vim.fn.has("win32") == 1 and "mingw32-make" or "make",
    },
  },

  config = function()
    require("telescope").setup({
      extensions = { fzf = {} },
    })
    -- fzf-native is optional: if its native build is missing, fall back to the
    -- default sorter instead of aborting the whole telescope config
    pcall(require("telescope").load_extension, "fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
  end,
}
