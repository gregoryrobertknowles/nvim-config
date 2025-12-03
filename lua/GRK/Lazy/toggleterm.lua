return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      shell = "/bin/zsh",
      size = 20,
      open_mapping = [[<c-\>]],
      direction = "horizontal", -- or "vertical" or "float"
    })
  end,
}
