return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python", "lua", "vim", "bash", "json", "rust", "c",
        "vimdoc", "markdown", "markdown_inline",
        "html", "css", "javascript", "typescript", "tsx",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
