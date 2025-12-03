return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure ruff with naming checks
    lint.linters.ruff.args = {
      "check",
      "--select=N,E,F,W", -- Naming, Errors, Pyflakes, Warnings
      "--ignore=E501, N817",
      "--output-format=json",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
      "-",
    }

    lint.linters_by_ft = {
      python = { "ruff" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
