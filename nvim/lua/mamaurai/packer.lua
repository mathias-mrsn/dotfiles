local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  
  local packer_bootstrap = ensure_packer()
  
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
  ]])
  
  local status, packer = pcall(require, "packer")
  if not status then
      return
  end
 
  return packer.startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nobbmaestro/nvim-andromeda",
		requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
	})
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    use("nvim-lualine/lualine.nvim")
end)
