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

return require('packer').startup(function(use)
  use '~/code/lua-plugin.nvim'
  use 'arcticicestudio/nord-vim'
  use 'chrisbra/csv.vim'
  use 'easymotion/vim-easymotion'
  use 'feline-nvim/feline.nvim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'mbbill/undotree'
  use 'morhetz/gruvbox'
  use 'sainnhe/everforest'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'wbthomason/packer.nvim'
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use { "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
}

  --use 'airblade/vim-gitgutter'
  --use 'alcesleo/vim-uppercase-sql'
  --use 'craigemery/vim-autotag'
  --use 'elzr/vim-json'
  --use 'ervandew/supertab'
  use 'godlygeek/tabular'
  --use 'honza/vim-snippets'
  --use 'jiangmiao/auto-pairs'
  --use 'leafgarland/typescript-vim'
  --use 'majutsushi/tagbar'
  --use 'mattn/emmet-vim'
  --use 'mustache/vim-mustache-handlebars'
  --use 'plasticboy/vim-markdown'
  --use 'sirver/ultisnips'
  --use 'skwp/greplace.vim'

  -- Set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
