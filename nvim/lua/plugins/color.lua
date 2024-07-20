return {
  -- {
  --   "nobbmaestro/nvim-andromeda",
  --   dependencies = { "tjdevries/colorbuddy.nvim" },
  --   config = function()
  --     require("andromeda").setup({
  --       preset = "andromeda",
  --       colors = {
  --         background = "#000000",
  --         mono_1 = "#2f323c", -- secondary background and/or highlighting
  --         mono_2 = "#3a3e4b", -- used for highlighting
  --         mono_3 = "#464959", -- used for highlighting
  --         mono_4 = "#606064",
  --         mono_5 = "#808187", -- comments
  --         mono_6 = "#d5ced9", -- normal text
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     -- vim.cmd("colorscheme tokyonight-night")
  --     require("tokyonight").setup({
  --       -- use the night style
  --       style = "night",
  --       -- disable italic for functions
  --       styles = {
  --         functions = {},
  --       },
  --       sidebars = { "qf", "vista_kind", "terminal", "packer" },
  --       -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  --       on_colors = function(colors)
  --         colors.bg = "#000000"
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  -- },
  -- {
  --   "dylanaraps/wal.vim",
  -- },
  -- {
  --   "rktjmp/lush.nvim",
  --   branch = "main",
  --   lazy = false,
  -- },
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
