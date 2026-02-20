return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      -- config
      config = {
        week_header = { enable = true },
      },
    })
  end,
  requires = { "nvim-tree/nvim-web-devicons" },
}
