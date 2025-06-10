return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },

  config = function()
    -- Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
        end,
      },
    })

    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- nvim-cmp set
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    })
    vim.diagnostic.config({
      virtual_text = true,
      singes = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
