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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- cmp plugins
  use ({
    "hrsh7th/nvim-cmp", 
    event = "InsertEnter",
    config = function()
      require("user.cmp")
    end

  })


  use ({
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp"
  })

  use ({
    "hrsh7th/cmp-path",
    after = "nvim-cmp"
  })

  use ({
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp"
  })

  use ({
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp"
  })

  -- snippets
  use ({
    "L3MON4D3/LuaSnip",
  }) 

  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use ({
    "nvim-telescope/telescope.nvim",
    event = "BufWinEnter",
    cmd=":Telescope",
    config = function()
      require("user.telescope")
    end
  })

  use ({
    "BurntSushi/ripgrep",
    event = "BufWinEnter",
    -- after = "telescope"
  })

  use "kyazdani42/nvim-web-devicons"
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = function()
      require("user.nvim-tree")
    end
  }

  use {
    'akinsho/bufferline.nvim',
    event = "BufWinEnter",
    config = function()
      require("user.bufferline")
    end
  }

  -- Treesitter
  use ({
    "nvim-treesitter/nvim-treesitter",
    event = "BufWinEnter",
    config = function()
      require("user.treesitter")
    end
  })

  use ({
    "Pocco81/auto-save.nvim",
    event = "InsertEnter",
    config = function()
      require("user.autosave")
    end,
  })

  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- gitsigns
  use ({
    'lewis6991/gitsigns.nvim',
    event = "BufWinEnter",
    config = function()
      require("user.gitsigns")
    end
  })

  -- Autopairs, integrates with both cmp and treesitter
  use ({
    "windwp/nvim-autopairs",
    event = "BufWinEnter",
    config = function()
      require("user.autopairs")
    end
  })


  use ({
    "nvim-lualine/lualine.nvim",
    event = "BufWinEnter",
    config = function()
      require("user.lualine")
    end
  }) 

  use ({
    "numToStr/Comment.nvim",
    event = "BufWinEnter",
    config = function()
      require("user.comment")
    end
  }) 

  use ({
    "Mofiqul/dracula.nvim",
  }) 

  use "lewis6991/impatient.nvim"
  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
