local Plug = vim.fn['plug#']

--plugins
vim.call('plug#begin', '~/.local/share/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'tpope/vim-surround'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'dense-analysis/ale'
  Plug 'SirVer/ultisnips'
  Plug 'carvalhudo/vim-snippets'
  Plug 'wincent/ferret'
  Plug 'mg979/vim-visual-multi'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-startify'
  Plug ('neoclide/coc.nvim', { tag = 'v0.0.81' })
  Plug 'easymotion/vim-easymotion'
  Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
vim.call('plug#end')

--misc
vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('set hidden')
vim.cmd('set showmatch')
