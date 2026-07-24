return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  keys = {
    { "<leader>ts", "<Cmd>SupermavenToggle<CR>", desc = "Toggle Supermaven" },
  },
  config = function()
    local blue = "#00A3FF"

    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-k>",
        accept_word = "<C-l>",
        clear_suggestion = "<C-]>",
      },
      color = {
        suggestion_color = blue,
        cterm = 39,
      },
      -- Ghost text inline, not routed through nvim-cmp
      disable_inline_completion = false,
      disable_keymaps = false,
    })

    -- Supermaven only applies `color` on VimEnter/ColorScheme. We load on
    -- InsertEnter, so VimEnter has already fired -- set it directly here and
    -- re-apply on any later colorscheme change.
    local function set_hl()
      vim.api.nvim_set_hl(0, "SupermavenSuggestion", { fg = blue, ctermfg = 39 })
      require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
    end

    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("GRKSupermavenColor", { clear = true }),
      callback = set_hl,
    })
  end,
}
