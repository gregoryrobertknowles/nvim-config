return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Install stylua and black if missing
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua", -- Lua
        "black", -- Python
      },
      auto_update = false,
      run_on_start = true,
    })

    -- Setup Conform
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
        lua = { "stylua" },
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        black = {
          prepend_args = { "--line-length", "150" }, -- optional
        },
      },
    })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
