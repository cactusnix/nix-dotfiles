return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    config = true,
  },
  -- The plugin can make jk to escape better.
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin makes start screen beautiful.
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
  },
  -- The plugin can show keybindings better.
  {
    "folke/which-key.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin can auto pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- The plugin show nice status line.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = true,
  },
  -- The plugin make motion nice.
  {
    "folke/flash.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin show indent blankline.
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufRead",
    config = true,
  },
  -- The plugin measure startup time, it uses vim script so maybe not need config = true.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
}
