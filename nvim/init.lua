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

-- plugin config
vim.cmd('let g:UltiSnipsExpandTrigger = "<tab>"')
vim.cmd('let g:UltiSnipsJumpForwardTrigger = "<c-b>"')
vim.cmd('let g:UltiSnipsJumpBackwardTrigger = "<c-z>"')
vim.cmd('let g:UltiSnipsEditSplit = "vertical"')
vim.cmd('let g:mkdp_browser = "qutebrowser"')
vim.cmd('let g:coc_disable_startup_warning = 1')
vim.cmd('let g:airline_theme = "zenburn"')
vim.cmd('let g:airline_symbols_ascii = 1')

-- appearence
vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('colorscheme zenburn')
vim.cmd('set background=dark')
vim.cmd('set cursorline')

vim.cmd('highlight cursorline cterm=none term=none ctermbg=238')
vim.cmd('highlight CursorLineNR cterm=none ctermbg=238')
vim.cmd('highlight LineNr cterm=none ctermfg=grey ctermbg=238')
vim.cmd('highlight ALEErrorSign ctermbg=238')
vim.cmd('highlight ALEWarningSign ctermbg=238')
vim.cmd('highlight SignColumn ctermbg=238')
vim.cmd('highlight GitGutterAdd ctermfg=green ctermbg=238')
vim.cmd('highlight GitGutterDelete ctermfg=red ctermbg=238')
vim.cmd('highlight GitGutterChange ctermfg=grey ctermbg=238')
vim.cmd('highlight VertSplit ctermbg=238 ctermfg=237')

-- FIXME
if (vim.bo.filetype == 'cpp') or (vim.bo.filetype == 'cpp') or (vim.bo.filetype == 'python') then
  vim.cmd('let &colorcolumn=join(range(81,999),",")')
  vim.cmd('highlight ColorColumn ctermbg=238 guibg=lightgrey')
end

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
vim.cmd('set ai')
vim.cmd('set shiftwidth=2')
vim.cmd('set tabstop=2')
vim.cmd('set expandtab')

-- keybinds
vim.cmd('let mapleader = "\\<space>"')

vim.cmd('nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>')
vim.cmd('nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>')
vim.cmd('nnoremap <leader>pu :PlugUpdate<cr>')
vim.cmd('nnoremap <leader>tt :8Term<cr>')
vim.cmd('nnoremap <leader>w  :w<cr>')
vim.cmd('nnoremap <leader>bc :Bclose<cr>')
vim.cmd('nnoremap <leader>nh :noh<cr>')
vim.cmd('nnoremap <leader>vs :vsplit<cr>')
vim.cmd('nnoremap <leader>s  :split<cr>')
vim.cmd('nnoremap <leader>tn :tabnext<cr>')
vim.cmd('nnoremap <leader>tp :tabprevious<cr>')
vim.cmd('nnoremap <leader>tc :tabclose<cr>')
vim.cmd('nnoremap <leader>m  :Man<cr>')
vim.cmd('nnoremap <leader>o  o<Esc>')
vim.cmd('nnoremap <leader>O  O<Esc>')

-- telescope hotkeys
vim.cmd('nnoremap <c-p> :Telescope find_files<cr>')
vim.cmd('nnoremap <c-f> :Telescope live_grep<cr>')
vim.cmd('nnoremap <c-e> :Telescope command_history<cr>')
vim.cmd('nnoremap <c-b> :Telescope buffers<cr>')

-- navigation hotkeys
vim.cmd('nnoremap <leader>l <c-w><Right>')
vim.cmd('nnoremap <leader>h <c-w><Left>')
vim.cmd('nnoremap <leader>k <c-w><Up>')
vim.cmd('nnoremap <leader>j <c-w><Down>')

-- disabling the arrow keys
vim.cmd('noremap <Up>    <Nop>')
vim.cmd('noremap <Down>  <Nop>')
vim.cmd('noremap <Left>  <Nop>')
vim.cmd('noremap <Right> <Nop>')

-- git hotkeys
vim.cmd('nnoremap <leader>gs  :Telescope git_status<cr>')
vim.cmd('nnoremap <leader>gc  :Git commit<cr>')
vim.cmd('nnoremap <leader>gca :Git commit --amend<cr>')
vim.cmd('nnoremap <leader>gh  :diffget //2<cr>')
vim.cmd('nnoremap <leader>gl  :diffget //3<cr>')

vim.cmd('nnoremap <a-;> <Esc>')
vim.cmd('cnoremap <a-;> <Esc>')
vim.cmd('tnoremap <a-;> <Esc>')
vim.cmd('vnoremap <a-;> <Esc>')
vim.cmd('snoremap <a-;> <Esc>')

-- cmds
vim.cmd('autocmd FileType text,markdown,tex set textwidth=99')
vim.cmd('autocmd BufWritePre * %s/\\s\\+$//e')
vim.cmd('autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif')
