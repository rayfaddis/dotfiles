-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup(plugins, opts)

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- packer setup
return require('packer').startup(function(use)
  -- use('tpope/vim-bundler')
  -- use('tpope/vim-projectionist')
  -- use('tpope/vim-rake')
  -- use('tpope/vim-repeat')
  -- use('tpope/vim-surround')
  use('tpope/vim-obsession')

  -- editing
  use('numToStr/Comment.nvim')
  use('folke/todo-comments.nvim')
  use('hrsh7th/vim-vsnip')
  use('hrsh7th/cmp-vsnip')
  use('windwp/nvim-autopairs')
  
  -- interface
  use('kyazdani42/nvim-tree.lua')
  use('lukas-reineke/indent-blankline.nvim')
  use('MunifTanjim/nui.nvim')
  use('VonHeikemen/fine-cmdline.nvim')
  use('glepnir/dashboard-nvim')
  -- use('vimpostor/vim-tpipeline')

  -- interface/tablines
  -- use('romgrk/barbar.nvim')
  use('akinsho/bufferline.nvim')
  -- use('nanozuki/tabby.nvim')
  -- use('noib3/nvim-cokeline')
  -- use('kdheepak/tabline.nvim')

  -- status line
  use('nvim-lualine/lualine.nvim')
  -- use({
  --   'SmiteshP/nvim-navic',
  --   requires = "neovim/nvim-lspconfig"
  -- }) -- show scope in winbar/status line
  use('arkav/lualine-lsp-progress') -- lsp initializiation status

  -- utilities
  use('pbrisbin/vim-mkdir')
  use('folke/trouble.nvim')
  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    run = { 'make' }
  })
  use('vim-test/vim-test')
  -- use({
  --   'nvim-neotest/neotest'
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   }
  -- })
  use('tpope/vim-eunuch')
  use('folke/which-key.nvim')
  use('aserowy/tmux.nvim')

  -- git
  use('lewis6991/gitsigns.nvim')
  -- use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use('sindrets/diffview.nvim')
  -- use('APZelos/blamer.nvim')
  use('ruanyl/vim-gh-line')

  -- lanuage server
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')
  use('jose-elias-alvarez/null-ls.nvim')

  -- language specific
  use({
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' } -- update parsers on updates
  })
  use('RRethy/nvim-treesitter-endwise')
  use('mogelbrod/vim-jsonpath')
  use('ellisonleao/glow.nvim') -- markdown previewer

  -- themes
  -- use({ 'decaycs/decay.nvim', as = 'decay' })
  use('navarasu/onedark.nvim')
  -- use('olimorris/onedarkpro.nvim')
  -- use('joshdick/onedark.vim')
  use('Mofiqul/vscode.nvim')

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- automatic sync if just having cloned packer the first time
  if packer_bootstrap then
    require('packer').sync()
  end
end)
