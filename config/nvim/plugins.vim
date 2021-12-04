if &compatible
  set nocompatible
end

call plug#begin(stdpath('data') . '/plugged')

" Define bundles via Github repos
Plug 'christoomey/vim-run-interactive'

" Misc plugins (TODO: review these!)
Plug 'pbrisbin/vim-mkdir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'

" Themes
Plug 'rakr/vim-one' " https://github.com/rakr/vim-one
Plug 'sonph/onehalf', { 'rtp': 'vim' } " https://github.com/sonph/onehalf
Plug 'chriskempson/base16-vim' " https://github.com/chriskempson/base16-vim
Plug 'joshdick/onedark.vim' " https://vimcolorschemes.com/joshdick/onedark.vim
Plug 'tomasr/molokai' " https://vimcolorschemes.com/tomasr/molokai
Plug 'petrblaho/herald.vim' " https://vimcolorschemes.com/petrblaho/herald.vim
Plug 'haron-prime/antares' " https://vimcolorschemes.com/haron-prime/antares
Plug 'adiospace/vim-adio' " https://github.com/adiospace/vim-adio
Plug 'evgenyzinoviev/vim-vendetta' " https://vimcolorschemes.com/evgenyzinoviev/vim-vendetta
Plug 'vim-scripts/hybrid.vim' " https://vimcolorschemes.com/vim-scripts/hybrid.vim
Plug 'raichoo/monodark' " https://vimcolorschemes.com/raichoo/monodark
Plug 'mangeshrex/uwu.vim' " https://vimcolorschemes.com/mangeshrex/uwu.vim
Plug 'k4yt3x/ayu-vim-darker' " https://vimcolorschemes.com/k4yt3x/ayu-vim-darker
Plug 'aryansh-s/fastdark.vim' " https://vimcolorschemes.com/aryansh-s/fastdark.vim
Plug 'taurusolson/creature.vim' " https://vimcolorschemes.com/taurusolson/creature.vim
Plug 'josuegaleas/jay' " https://vimcolorschemes.com/josuegaleas/jay

" Icons
Plug 'kyazdani42/nvim-web-devicons' " A lua fork of vim-devicons

" Language server
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Language specific
Plug 'mogelbrod/vim-jsonpath'
Plug 'ellisonleao/glow.nvim' " Markdown previewer

" Interface - editor
Plug 'kyazdani42/nvim-tree.lua'
Plug 'famiu/feline.nvim'
Plug 'nanozuki/tabby.nvim'
" Plug 'lambdalisue/nerdfont.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'

" Utilities - todos, snippets & formatting
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'folke/todo-comments.nvim'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'windwp/nvim-autopairs'

" Utlities - git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'

" Other
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'folke/trouble.nvim'
Plug 'vim-test/vim-test'

call plug#end()
