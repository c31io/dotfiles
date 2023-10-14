" Native settings
filetype plugin indent on   " allow auto-indenting depending on file type
filetype plugin on          " run file type plugins
set shm+=I                  " hide intro message
set autoindent              " indent a new line
"set cc=81                  " set an 80 column border for good coding style
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
lua require('plugins')
lua require('config.nvim-tree')
lua require('config.cmp')
if !&diff
lua require('config.rust-tools')
endif
lua require('config.treesitter')
lua require('config.dap')
lua require('config.tabby')
lua require('config.feline')
lua require('config.telescope')
lua require('opts')

" Git commands
noremap <Leader>gf :!gf<CR>
noremap <Leader>gst :!gst<CR>
noremap <Leader>gl :terminal gl<CR>
noremap <Leader>gcm :terminal gcm<CR>ii
noremap <Leader>ga :!ga<CR>
noremap <Leader>gr :!gr<CR>
noremap <Leader>gp :!gp<CR>
noremap <Leader>gd :terminal gd<CR>i

" Cargo commands
noremap <Leader>cf :update<CR>:!cargo fmt<CR>
noremap <Leader>cc :!cargo check<CR>
noremap <Leader>cl :vsplit term://cargo clippy<CR>
noremap <Leader>cr :update<CR>:vsplit term://cargo run<CR>
noremap <Leader>ct :update<CR>:vsplit term://cargo test<CR>
command! -nargs=* Cr !cargo run <args>

" Haskell commands
noremap <Leader>hr :update<CR>:terminal ghci *.hs <CR>i

" Flutter commands
noremap <Leader>fr :FlutterRun -d linux<CR>
noremap <Leader>fq :FlutterQuit

" Use CTRL-S for saving in all modes
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR><Esc>
inoremap <C-S> <C-O>:update<CR><Esc>

" Close all, useful in diff
noremap ZA :qa<CR>

" Common typos
command! Q q
command! W w

" GUI settings: neovim-qt
if exists(':GuiFont')
    GuiFont FiraCode Nerd Font:h13.5
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

" GUI settings: neovide
if exists("g:neovide")
    let g:neovide_transparency = 0.8
    let g:neovide_hide_mouse_when_typing = v:true
endif

" Disable providers
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
