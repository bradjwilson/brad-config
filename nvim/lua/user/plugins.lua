local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use a protected call so we don't error out on first use
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim"} -- Have packer manage itself
  use { "lewis6991/impatient.nvim" }

  use { "nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs"} -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim"}
  use { "JoosepAlviste/nvim-ts-context-commentstring"}
  use { "nvim-tree/nvim-web-devicons"}
  use { "nvim-tree/nvim-tree.lua"}

  use { "akinsho/bufferline.nvim"}
  use { "moll/vim-bbye"}
  use { "nvim-lualine/lualine.nvim"}
--  use { "akinsho/toggleterm.nvim"}
  use { "ahmedkhalf/project.nvim"}
  use { "lukas-reineke/indent-blankline.nvim"}
  use { "goolord/alpha-nvim"}
  use { "danymat/neogen",
      config = function()
          require('neogen').setup {}
      end,
      requires = "nvim-treesitter/nvim-treesitter",
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
  }


  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim"}
  use { "folke/tokyonight.nvim"}
  use { "lunarvim/darkplus.nvim"}
  use { "shaunsingh/moonlight.nvim" }
  use { "Mofiqul/dracula.nvim" }
  use { "ishan9299/nvim-solarized-lua" }
  use { "rebelot/kanagawa.nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"} -- The completion plugin
  use { "hrsh7th/cmp-buffer"} -- buffer completions
  use { "hrsh7th/cmp-path"} -- path completions
  use { "saadparwaiz1/cmp_luasnip"} -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"}
  use { "hrsh7th/cmp-nvim-lua"}
  use { "github/copilot.vim"}

  -- Generic writing plugins
  use {"iamcco/markdown-preview.nvim"}

  -- snippets
  use { "L3MON4D3/LuaSnip"} --snippet engine
  use { "rafamadriz/friendly-snippets"} -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig"} -- enable LSP
  use { "williamboman/nvim-lsp-installer"} -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
  use { "RRethy/vim-illuminate"}
  
  -- Telescope
  use { "nvim-telescope/telescope.nvim"}

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter"}
  use { 'nvim-treesitter/nvim-treesitter-context'}
  -- Symantic Highlighting
--  use { "neoclide/coc.nvim" }
--  use { "jackguo380/vim-lsp-cxx-highlight" }
--  use { "mphe/grayout.vim" }

  -- cmake
  use { "Shatur/neovim-cmake" }
-- use { "winston0410/cmd-parser.nvim" }
 -- use { "winston0410/range-highlight.nvim" }
 -- use { "Rasukarusan/nvim-select-multi-line" }
  -- Git
  use { "lewis6991/gitsigns.nvim"}

  -- DAP
  use { "mfussenegger/nvim-dap"}
  use { "rcarriga/nvim-dap-ui"}
  use { "ravenxrz/DAPInstall.nvim"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
