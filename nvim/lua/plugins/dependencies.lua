return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    opts = {
      ensure_installed = "all",
      sync_install = true,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
