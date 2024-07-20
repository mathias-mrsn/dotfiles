return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- {
  --   "https://git.sr.ht/~swaits/zellij-nav.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   -- keys = {
  --   --   { "<A-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
  --   --   { "<A-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
  --   --   { "<A-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
  --   --   { "<A-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
  --   -- },
  --   opts = {},
  --   -- config = function()
  --   --     vim.keymap.set('n', "<ALT+l", ":ZellijNavigateRight", {});
  --   --     vim.keymap.set('n', "<ALT+k", ":ZellijNavigateUp", {});
  --   --     vim.keymap.set('n', "<ALT+j", ":ZellijNavigateDown", {});
  --   --     vim.keymap.set('n', "<ALT+h", ":ZellijNavigateLeft", {});
  --   --     require('zellij').setup({})
  --   -- end
  -- }
  -- {
  --   'Lilja/zellij.nvim',
  --   config = function()
  --       vim.keymap.set('n', "<ALT+l", ":ZellijNavigateRight", {});
  --       vim.keymap.set('n', "<ALT+k", ":ZellijNavigateUp", {});
  --       vim.keymap.set('n', "<ALT+j", ":ZellijNavigateDown", {});
  --       vim.keymap.set('n', "<ALT+h", ":ZellijNavigateLeft", {});
  --       require('zellij').setup({})
  --   end
  -- }
}
