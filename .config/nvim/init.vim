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

"colorscheme terafox
"colorscheme nightfox
colorscheme nordfox

lua require('plugins')
lua require('rust-tools-config')
lua require('treesitter-config')
lua require('dap-config')
lua require('opts')
lua require('tabby-config')
lua require('feline-config')

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
