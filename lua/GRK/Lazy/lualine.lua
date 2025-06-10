return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      theme = "everforest",
      section_separators = "",
      component_separators = "",
    })

    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    table.insert(opts.sections.lualine_x, 3, {
      function()
        return require("pomodoro").get_pomodoro_status("🍅❌", "🍅", "☕")
      end,
    })
  end,
}

-- Need to add the whichpy line in so I can see what python env?
