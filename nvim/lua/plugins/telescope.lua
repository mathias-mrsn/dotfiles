return {
  -- Fuzzy finder
  -- Source -> https://github.com/exosyphon/nvim/blob/main/lua/plugins/telescope.lua

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local actions = require("telescope.actions")
      -- This is your opts table
      require("telescope").setup {
        defaults = {
          -- `hidden = true` is not supported in text grep commands.

          path_display = { "truncate" },
          mappings = {
            n = {
              ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            i = {
              ["<C-j>"] = actions.cycle_history_next,
              ["<C-k>"] = actions.cycle_history_prev,
              -- ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.delete_buffer,
              ["<C-q>"] = actions.close,
              -- ["<C-s>"] = actions.cycle_previewers_next,
              -- ["<C-a>"] = actions.cycle_previewers_prev,
            },
          },
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>', {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
      -- vim.keymap.set('n', '<leader>fi', '<cmd>AdvancedGitSearch<CR>', {})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})

    end

  }
}
