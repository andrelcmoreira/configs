local Plug = vim.fn['plug#']

-- plugins
vim.call('plug#begin', '~/.local/share/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim' -- FIXME
  Plug 'tpope/vim-surround'
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
  Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
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

-- appearence
vim.cmd('colorscheme zenburn')
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true
vim.o.background = 'dark'

vim.cmd([[
  highlight cursorline cterm=none term=none ctermbg=238
  highlight CursorLineNR cterm=none ctermbg=238
  highlight LineNr cterm=none ctermfg=grey ctermbg=238
  highlight ALEErrorSign ctermbg=238
  highlight ALEWarningSign ctermbg=238
  highlight SignColumn ctermbg=238
  highlight GitGutterAdd ctermfg=green ctermbg=238
  highlight GitGutterDelete ctermfg=red ctermbg=238
  highlight GitGutterChange ctermfg=grey ctermbg=238
  highlight VertSplit ctermbg=238 ctermfg=237
]])

-- FIXME
--if (vim.bo.filetype == 'c') or (vim.bo.filetype == 'cpp') or (vim.bo.filetype == 'python') then
vim.cmd('let &colorcolumn=join(range(81,999),",")')
vim.cmd('highlight ColorColumn ctermbg=238 guibg=lightgrey')
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

-- keybinds
vim.g.mapleader = " "

vim.cmd([[
  nnoremap <leader>ev :vsplit ~/.config/nvim/init.lua<cr>
  nnoremap <leader>sv :source ~/.config/nvim/init.lua<cr>
  nnoremap <leader>pu :PlugUpdate<cr>
  nnoremap <leader>w  :w<cr>
  nnoremap <leader>bc :bdelete<cr>
  nnoremap <leader>t  :terminal<cr>
  nnoremap <leader>nh :noh<cr>
  nnoremap <leader>vs :vsplit<cr>
  nnoremap <leader>s  :split<cr>
  nnoremap <leader>tn :tabnext<cr>
  nnoremap <leader>tp :tabprevious<cr>
  nnoremap <leader>tc :tabclose<cr>
  nnoremap <leader>o  o<Esc>
  nnoremap <leader>O  O<Esc>
]])

-- telescope hotkeys
vim.cmd([[
  nnoremap <c-p> :Telescope find_files<cr>
  nnoremap <c-f> :Telescope live_grep<cr>
  nnoremap <c-e> :Telescope command_history<cr>
  nnoremap <c-b> :Telescope buffers<cr>
]])

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
vim.cmd([[
  nnoremap <a-;> <Esc>
  cnoremap <a-;> <Esc>
  tnoremap <a-;> <Esc>
  vnoremap <a-;> <Esc>
  snoremap <a-;> <Esc>
]])

-- cmds
vim.cmd([[
  autocmd FileType text,markdown,tex set textwidth=99
  autocmd BufWritePre * %s/\\s\\+$//e
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
]])
