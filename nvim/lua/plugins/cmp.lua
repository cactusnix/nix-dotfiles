return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- For repo because last release is way too old.
    dependencies = {
      "saadparwaiz1/cmp_luasnip", -- Bridge for LuaSnip
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = "InsertEnter",
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completionopt = "menu,menuone,noselect",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use LuaSnip engine.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["C-n"] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ["C-p"] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ["C-b"] = cmp.mapping.scroll_docs(-4),
          ["C-f"] = cmp.mapping.scroll_docs(4),
          ["C-e"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  -- The plugin is cmp engine.
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    keys = {
      {
        "<Tab>",
        function()
          local luasnip = require("luasnip")
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          end
        end,
        mode = { "i", "s" },
      },
      {
        "<S-Tab>",
        function()
          local luasnip = require("luasnip")
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end,
        mode = { "i", "s" },
      },
    },
  },
}
