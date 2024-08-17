local Plug = vim.fn['plug#']

-- plugins
vim.call('plug#begin', '~/.local/share/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'tpope/vim-surround'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'dense-analysis/ale'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mg979/vim-visual-multi'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-startify'
  Plug ('neoclide/coc.nvim', { tag = 'v0.0.81' })
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'bradsherman/git-worktree.nvim'
  Plug 'puremourning/vimspector'
vim.call('plug#end')

-- plugin config
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.mkdp_browser = "qutebrowser"
vim.g.coc_disable_startup_warning = 1
vim.g.airline_theme = "zenburn"
vim.g.airline_symbols_ascii = 1

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "tags"
    }
  }
}

require("telescope").load_extension("git_worktree")

-- appearence
vim.cmd('colorscheme zenburn')
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true
vim.o.background = 'dark'

vim.cmd([[
  highlight cursorline cterm=none term=none ctermbg=238
  highlight CursorLineNR cterm=none ctermbg=238 guibg=#3f3f3f
  highlight LineNr cterm=none ctermfg=grey ctermbg=238 guibg=#3f3f3f
  highlight ALEErrorSign ctermbg=238 guibg=#3f3f3f
  highlight ALEWarningSign ctermbg=238 guibg=#3f3f3f
  highlight SignColumn ctermbg=238 guibg=#3f3f3f
  highlight GitGutterAdd ctermfg=green ctermbg=238 guibg=#3f3f3f guifg=green
  highlight GitGutterDelete guifg=red ctermfg=red ctermbg=238 guibg=#3f3f3f
  highlight GitGutterChange guifg=lightgrey ctermfg=lightgrey ctermbg=238 guibg=#3f3f3f
  highlight CocErrorSign ctermbg=red guibg=#3f3f3f
  highlight VertSplit ctermbg=238 ctermfg=237
]])

-- FIXME
--if (vim.bo.filetype == 'c') or (vim.bo.filetype == 'cpp') or (vim.bo.filetype == 'python') then
vim.cmd('let &colorcolumn=join(range(81,999),",")')
vim.cmd('highlight ColorColumn ctermbg=238 guibg=#3f3f3f')
--end

-- misc
vim.cmd('set hidden')
vim.cmd('set showmatch')
vim.cmd('set mouse=a')
vim.cmd('set inccommand=split')
vim.cmd('set splitbelow splitright')
vim.cmd('set numberwidth=5')
vim.cmd('syntax on')
vim.cmd('filetype detect')
vim.cmd('set showmatch')

-- indentation
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.cmd('set ai')
vim.cmd('set expandtab')

-- misc hotkeys
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>sv', ':source ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>pu', ':PlugUpdate<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>bc', ':bdelete<cr>')
vim.keymap.set('n', '<leader>tt', ':terminal<cr>i')
vim.keymap.set('n', '<leader>nh', ':noh<cr>')
vim.keymap.set('n', '<leader>vs', ':vsplit<cr>')
vim.keymap.set('n', '<leader>s', ':split<cr>')
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

-- telescope hotkeys
vim.keymap.set('n', '<c-p>', ':Telescope find_files<cr>')
vim.keymap.set('n', '<c-f>', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<c-e>', ':Telescope command_history<cr>')
vim.keymap.set('n', '<c-b>', ':Telescope buffers<cr>')
vim.keymap.set('n', '<c-g>', ':Telescope git_worktree<cr>')

-- buffer navigation hotkeys
vim.keymap.set('n', '<leader>l', '<c-w><Right>')
vim.keymap.set('n', '<leader>h', '<c-w><Left>')
vim.keymap.set('n', '<leader>k', '<c-w><Up>')
vim.keymap.set('n', '<leader>j', '<c-w><Down>')

-- disabling the arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- git hotkeys
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<cr>')
vim.keymap.set('n', '<leader>gc', ':Git commit<cr>')
vim.keymap.set('n', '<leader>gca', ':Git commit --amend<cr>')
vim.keymap.set('n', '<leader>gh', ':diffget //2<cr>')
vim.keymap.set('n', '<leader>gl', ':diffget //3<cr>')

-- other
vim.keymap.set('n', '<a-;>', '<Esc>')
vim.keymap.set('c', '<a-;>', '<Esc>')
vim.keymap.set('t', '<a-;>', '<Esc>')
vim.keymap.set('v', '<a-;>', '<Esc>')
vim.keymap.set('s', '<a-;>', '<Esc>')

-- cmds
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '',
  command = '%s/\\s\\+$//e'
})
