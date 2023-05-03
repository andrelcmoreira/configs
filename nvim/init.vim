" Plugins {{{
call plug#begin()
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
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
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}
    Plug 'easymotion/vim-easymotion'
call plug#end()
" }}}

" Misc {{{
set hidden
set mouse=a
set inccommand=split
set splitbelow splitright
set number relativenumber
set numberwidth=5
syntax on
filetype detect
set showmatch

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"

let g:mkdp_browser = "qutebrowser"

let g:coc_disable_startup_warning = 1
" }}}

" Appearance {{{
colorscheme zenburn
set background=dark

set cursorline
highlight cursorline cterm=none term=none ctermbg=238
highlight CursorLineNR cterm=none ctermbg=238
highlight LineNr cterm=none ctermfg=grey ctermbg=238

let g:airline_theme = "zenburn"
let g:airline_symbols_ascii = 1

highlight ALEErrorSign ctermbg=238
highlight ALEWarningSign ctermbg=238
highlight SignColumn ctermbg=238
highlight GitGutterAdd ctermfg=green ctermbg=238
highlight GitGutterDelete ctermfg=red ctermbg=238
highlight GitGutterChange ctermfg=grey ctermbg=238

if (&ft == 'c') || (&ft == 'cpp') || (&ft == 'python')
    let &colorcolumn=join(range(81,999),",")
    highlight ColorColumn ctermbg=238 guibg=lightgrey
endif

highlight VertSplit ctermbg=238 ctermfg=237
" }}}

" Indentation {{{
set ai
set shiftwidth=2
set tabstop=2
set expandtab
" }}}

" Keybinds {{{
let mapleader = "\<space>"

nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>tt :8Term<cr>
nnoremap <leader>w  :w<cr>
nnoremap <leader>bc :Bclose<cr>
nnoremap <leader>nh :noh<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>s  :split<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>m  :Man<cr>
nnoremap <leader>o  o<Esc>
nnoremap <leader>O  O<Esc>
nnoremap <leader>cf :!clang-format -i --style=Google %<Esc><cr>:e<Esc>

" fzf hotkeys
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ack<space>
nnoremap <c-e> :History:<cr>
nnoremap <c-b> :Buffers<cr>

" navigation hotkeys
nnoremap <leader>l <c-w><Right>
nnoremap <leader>h <c-w><Left>
nnoremap <leader>k <c-w><Up>
nnoremap <leader>j <c-w><Down>

" disabling the arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" git hotkeys
nnoremap <leader>gs  :Git<cr>
nnoremap <leader>gc  :Git commit<cr>
nnoremap <leader>gca :Git commit --amend<cr>
nnoremap <leader>gh  :diffget //2<cr>
nnoremap <leader>gl  :diffget //3<cr>

if (&ft == 'c') || (&ft == 'cpp')
    nnoremap <leader>c _i//<Esc>
    nnoremap <leader>u _xx
    iabbrev dbg printf("%s:%d\n", __FUNCTION__, __LINE__);
elseif (&ft == 'python') || (&ft == 'sh') || (&ft == 'yaml')
    nnoremap <leader>c _i#<Esc>
    nnoremap <leader>u _x
elseif (&ft == 'markdown')
    if executable('pandoc')
        nnoremap <leader>cm :silent !pandoc -s -o %.pdf % && zathura %.pdf &<cr><cr>
    endif
endif

nnoremap <a-;> <Esc>
cnoremap <a-;> <Esc>
tnoremap <a-;> <Esc>
vnoremap <a-;> <Esc>
snoremap <a-;> <Esc>
" }}}

" Cmds {{{
autocmd FileType text,markdown,tex set textwidth=99
autocmd BufWritePre * %s/\s\+$//e
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" vim:foldmethod=marker:foldlevel=0
