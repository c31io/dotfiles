-- Options --
local o = vim.opt

-- Hide intro message
o.shortmess:append({ I = true })

-- Use system clipboard
o.clipboard = "unnamedplus"

-- 4-space indentation
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Line number
o.number = true
o.relativenumber = true

-- Highlight cursor line
o.cursorline = true

-- Diagnostics column
o.signcolumn = "number"

-- Mappings --
function m(from, to) return vim.keymap.set('', from, to) end

-- Git commands
m('<Leader>gf', ':!gf<CR>')
m('<Leader>gst', ':!gst<CR>')
m('<Leader>gl', ':terminal gl<CR>')
m('<Leader>gcm', ':terminal gcm<CR>ii')
m('<Leader>ga', ':!ga<CR>')
m('<Leader>gr', ':!gr<CR>')
m('<Leader>gp',':!gp<CR>')
m('<Leader>gd', ':terminal gd<CR>i')

-- Cargo commands
m('<Leader>cf', ':update<CR>:!cargo fmt<CR>')
m('<Leader>cc', ':!cargo check<CR>')
m('<Leader>cl', ':vsplit term://cargo clippy<CR>')
m('<Leader>cr', ':update<CR>:vsplit term://cargo run<CR>')
m('<Leader>ct', ':update<CR>:vsplit term://cargo test<CR>')

-- Haskell commands
m('<Leader>hr', ':update<CR>:terminal ghci *.hs <CR>i')

-- Flutter commands
m('<Leader>fr', ':FlutterRun -d linux<CR>')
m('<Leader>fq', ':FlutterQuit')

-- Use CTRL-S for saving in all modes
m('<C-S>', '<Esc>:update<CR><Esc>')

-- Close all, useful in diff
m('ZA', ':qa<CR>')

-- Commands --
function c(from, to) return vim.api.nvim_create_user_command(from, to, {}) end

-- Common typos
c('Q', 'q')
c('W', 'w')

-- GUI settings --
local g = vim.g

-- Nrovide
if vim.fn.exists('g:neovide') then
    g.neovide_transparency = 0.8
    g.neovide_hide_mouse_when_typing = true
end

-- Disable providers --
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

require('plugins')
require('config.nvim-tree')
require('config.cmp')
require('config.rust-tools')
require('config.treesitter')
require('config.dap')
require('config.tabby')
require('config.feline')
require('config.telescope')
require('opts')
