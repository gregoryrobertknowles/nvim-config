return {
  "romgrk/barbar.nvim",
  dependencies = { "nvim-web-devicons" },

  config = function()
    vim.g.barbar_auto_setup = false -- disable auto setup if you want to configure manually
    require("barbar").setup({
      animation = true,
      clickable = true,
      icons = {
        buffer_index = true,
        filetype = {
          enabled = true,
        },
        separator = { left = "▎", right = "" },
      },
    })
  end,
}
