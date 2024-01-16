return {

  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    vim.cmd("colorscheme onedark_dark")
  end,

  -- somewhere in your config:
  -- vim.cmd("colorscheme onedark"),

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "night" },
  -- },

  --   "projekt0n/github-nvim-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       -- ...
  --     })
  --
  --     vim.cmd("colorscheme github_dark_high_contrast")
  --   end,
  -- },
}
