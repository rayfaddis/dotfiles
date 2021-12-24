-- automatically install packer if not yet on this machine
local install_path =
  vim.fn.stdpath('data')
  ..
  '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- packer setup
return require('packer').startup(function(use)
  -- use('tpope/vim-bundler')
  -- use('tpope/vim-endwise')
  -- use('tpope/vim-projectionist')
  -- use('tpope/vim-rake')
  -- use('tpope/vim-repeat')
  -- use('tpope/vim-surround')

  -- editing
  use('vim-scripts/tComment')
  use('folke/todo-comments.nvim')
  use('SirVer/ultisnips')
  use('quangnguyen30192/cmp-nvim-ultisnips')
  use('windwp/nvim-autopairs')
  
  -- interface
  use('kyazdani42/nvim-tree.lua')
  use('famiu/feline.nvim')
  use('nanozuki/tabby.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('MunifTanjim/nui.nvim')
  use('VonHeikemen/fine-cmdline.nvim')
  use('glepnir/dashboard-nvim')

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
  use({
    'rcarriga/vim-ultest',
    requires = { 'vim-test/vim-test' },
    run = { ':UpdateRemotePlugins' }
  })
  use('tpope/vim-eunuch')
  use('folke/which-key.nvim')

  -- git
  use('lewis6991/gitsigns.nvim')
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use('sindrets/diffview.nvim')
  use('APZelos/blamer.nvim')
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
  use('mogelbrod/vim-jsonpath')
  use('ellisonleao/glow.nvim') -- markdown previewer

  -- themes
  -- use('joshdick/onedark.vim')
  use('navarasu/onedark.nvim')

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- automatic sync if just having cloned packer the first time
  if packer_bootstrap then
    require('packer').sync()
  end
end)
