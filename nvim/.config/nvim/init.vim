" Native settings
filetype plugin indent on   " allow auto-indenting depending on file type
filetype plugin on
set autoindent              " indent a new line
set cc=81                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
set expandtab               " converts tabs to white space
set hlsearch                " highlight search
set ignorecase              " case insensitive
set incsearch               " incremental search
set mouse=a                 " enable mouse click
"set mouse=v                 " middle-click paste with
set number                  " add line numbers
set relativenumber
set showmatch               " show matching
let tab=4
let &shiftwidth=tab         " width for autoindents
let &softtabstop=tab        " so <BS> does the right thing
let &tabstop=tab            " number of columns occupied by a tab
syntax on                   " syntax highlighting

" Lua settings
lua require('config.nightfox')
"colorscheme terafox
"colorscheme nightfox
colorscheme nordfox
lua require('plugins')
lua require('config.nvim-tree')
lua require('config.cmp')
lua require('config.rust-tools')
lua require('config.treesitter')
lua require('config.dap')
lua require('config.tabby')
lua require('config.feline')
lua require('opts')

" Git commands
map <Leader>gf :!git fetch<CR>
map <Leader>gs :!git status<CR>
map <Leader>gl :!gl<CR>
map <Leader>gc :terminal git commit<CR>ii
map <Leader>ga :!git add --all<CR>
map <Leader>gp :!git push<CR>
" Cargo commands
map <Leader>cf :!cargo fmt<CR>
map <Leader>cc :!cargo check<CR>
map <Leader>cl :terminal cargo clippy<CR>
map <Leader>cr :update<CR>:!cargo run<CR>
" Haskell commands
map <Leader>hr :update<CR>:terminal ghci *.hs <CR>i

" Use CTRL-S for saving in all modes
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Font settings for neovim-qt
if exists(':GuiFont')
  GuiFont FiraCode Nerd Font:h13.5
  "GuiFont Fira Code:h13.5
  "GuiFont JetBrains Mono:h13.5
endif
if exists(':GuiWindowOpacity')
  GuiWindowOpacity 0.8
endif
if exists(':GuiRenderLigature')
  GuiRenderLigature 1
endif
if exists(':GuiScrollBar')
  GuiScrollBar 0
endif
