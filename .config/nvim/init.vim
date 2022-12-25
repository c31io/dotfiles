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
set mouse=v                 " middle-click paste with
set number                  " add line numbers
set relativenumber
set shiftwidth=4            " width for autoindents
set showmatch               " show matching
set softtabstop=4           " so <BS> does the right thing
set tabstop=4               " number of columns occupied by a tab
syntax on                   " syntax highlighting

lua require('plugins')

colorscheme terafox
