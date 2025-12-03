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
        -- "black", -- Python
        "ruff", -- added to replace black, and flake8 even though not installed
        "clang-format",
        "prettier",
      },
      auto_update = false,
      run_on_start = true,
    })

    -- Setup Conform
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        -- python = { "black" },
        lua = { "stylua" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
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
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
