return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      config = {
        week_header = { enable = true },
        project = { enable = true, limit = 8, action = "Telescope find_files cwd=" },
        mru = { limit = 10 },
        shortcut = {
          { desc = " Find File", group = "Label", action = "Telescope find_files", key = "f" },
          { desc = " Recent Files", group = "Label", action = "Telescope oldfiles", key = "r" },
          { desc = " Grep", group = "Label", action = "Telescope live_grep", key = "g" },
          {
            desc = " Config",
            group = "Label",
            key = "c",
            action = function()
              local init_path = vim.fn.expand("$MYVIMRC")
              local init_dir = vim.fn.fnamemodify(init_path, ":h")
              vim.cmd("edit " .. init_path)
              require("nvim-tree.api").tree.open()
              require("nvim-tree.api").tree.change_root(init_dir)
              require("nvim-tree.api").tree.find_file({ open = true, focus = true })
            end,
          },
          { desc = " Quit", group = "Label", action = "qa", key = "q" },
        },
      },
    })
  end,
}
