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
set mouse=av                " enable mouse click and middle-click paste
set number                  " add line numbers
set relativenumber          " relative line number
set showmatch               " show matching
set cursorline              " highlight cursor line
let tab=4                   " 4-space indentation
let &shiftwidth=tab         " width for autoindents
let &softtabstop=tab        " so <BS> does the right thing
let &tabstop=tab            " number of columns occupied by a tab
syntax on                   " syntax highlighting

" Lua settings
lua require('config.nightfox')
"colorscheme terafox
colorscheme nightfox
"colorscheme nordfox
lua require('plugins')
lua require('config.nvim-tree')
lua require('config.cmp')
lua require('config.rust-tools')
lua require('config.treesitter')
lua require('config.dap')
lua require('config.tabby')
lua require('config.feline')
lua require('config.telescope')
lua require('opts')

" Git commands
map <Leader>gf :!gf<CR>
map <Leader>gst :!gst<CR>
map <Leader>gl :!gl<CR>
map <Leader>gcm :terminal gcm<CR>ii
map <Leader>ga :!ga<CR>
map <Leader>gp :!gp<CR>
map <Leader>gd :terminal gd<CR>i
map ZA :qa<CR>
" Cargo commands
map <Leader>cf :!cargo fmt<CR>
map <Leader>cc :!cargo check<CR>
map <Leader>cl :vsplit term://cargo clippy<CR>
map <Leader>cr :update<CR>:split term://cargo run<CR>
" Haskell commands
map <Leader>hr :update<CR>:terminal ghci *.hs <CR>i
" Flutter commands
map <Leader>fr :FlutterRun -d linux<CR>
map <Leader>fq :FlutterQuit

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

" Neovide
if exists("g:neovide")
    let neovide_transparency = 0.8
endif

" Disable providers
let g:loaded_ruby_provider = 0
let g:loaded_node_provider= 0
let g:loaded_perl_provider = 0
