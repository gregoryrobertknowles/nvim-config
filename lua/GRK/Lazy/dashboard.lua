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
          { desc = " Quit", group = "Label", action = "qa", key = "q" },
        },
      },
    })
  end,
}
