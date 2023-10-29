-- Original file
-- https://github.com/UserEast/nightfox.nvim/tree/main/mics/tabby.lua

local fmt = string.format

local hex = function(n)
    if n then
        return fmt("#%06x", n)
    end
end

local function parse_style(style)
    if not style or style == "NONE" then
        return {}
    end

    local result = {}
    for token in string.gmatch(style, "([^,]+)") do
        result[token] = true
    end

    return result
end

local function get_highlight(name)
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    if hl.link then
        return get_highlight(hl.link)
    end

    local result = parse_style(hl.style)
    result.fg = hl.foreground and hex(hl.foreground)
    result.bg = hl.background and hex(hl.background)
    result.sp = hl.special and hex(hl.special)

    return result
end

local function set_highlights(groups)
    for group, opts in pairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

local function generate_pallet_from_colorscheme()
    local color_map = {
        black   = { index = 0, default = "#393b44" },
        red     = { index = 1, default = "#c94f6d" },
        green   = { index = 2, default = "#81b29a" },
        yellow  = { index = 3, default = "#dbc074" },
        blue    = { index = 4, default = "#719cd6" },
        magenta = { index = 5, default = "#9d79d6" },
        cyan    = { index = 6, default = "#63cdcf" },
        white   = { index = 7, default = "#dfdfe0" },
    }

    local pallet = {}
    for name, value in pairs(color_map) do
        local global_name = "terminal_color_" .. value.index
        pallet[name] = vim.g[global_name] and vim.g[global_name] or value.default
    end

    pallet.sl = get_highlight("StatusLine")
    pallet.tab = get_highlight("TabLine")
    pallet.sel = get_highlight("TabLineSel")
    pallet.fill = get_highlight("TabLineFill")

    return pallet
end

_G._genreate_user_tabline_highlights = function()
    local pal = generate_pallet_from_colorscheme()

    local sl_colors = {
        Black   = { fg = pal.black, bg = pal.white },
        Red     = { fg = pal.red, bg = pal.sl.bg },
        Green   = { fg = pal.green, bg = pal.sl.bg },
        Yellow  = { fg = pal.yellow, bg = pal.sl.bg },
        Blue    = { fg = pal.blue, bg = pal.sl.bg },
        Magenta = { fg = pal.magenta, bg = pal.sl.bg },
        Cyan    = { fg = pal.cyan, bg = pal.sl.bg },
        White   = { fg = pal.white, bg = pal.black },
    }

    local colors = {}
    for name, value in pairs(sl_colors) do
        colors["User" .. name] = { fg = value.fg, bg = value.bg, bold = true }
        colors["UserRv" .. name] = { fg = value.bg, bg = value.fg, bold = true }
    end

    local groups = {
        UserTLHead = { fg = pal.fill.bg, bg = pal.cyan },
        UserTLHeadSep = { fg = pal.cyan, bg = pal.fill.bg },
        UserTLActive = { fg = pal.sel.fg, bg = pal.sel.bg, bold = true },
        UserTLActiveSep = { fg = pal.sel.bg, bg = pal.fill.bg },
        UserTLBoldLine = { fg = pal.tab.fg, bg = pal.tab.bg, bold = true },
        UserTLLineSep = { fg = pal.tab.bg, bg = pal.fill.bg },
    }

    set_highlights(vim.tbl_extend("force", colors, groups))
end

_genreate_user_tabline_highlights()

vim.api.nvim_create_augroup("UserTablineHighlightGroups", { clear = true })
vim.api.nvim_create_autocmd({ "SessionLoadPost", "ColorScheme" }, {
    callback = function()
        _genreate_user_tabline_highlights()
    end,
})

local filename = require 'tabby.filename'
local line = {
    hl = "TabLineFill",
    layout = "active_wins_at_tail",
    active_tab = {
        label = function(tabid)
            return {
                " " .. tabid .. " ",
                hl = "UserTLActive",
            }
        end,
    },
    inactive_tab = {
        label = function(tabid)
            return {
                " " .. tabid .. " ",
                hl = "UserTLBoldLine",
            }
        end,
    },
    top_win = {
        label = function(winid)
            return {
                "  " .. filename.unique(winid) .. " ",
                hl = "TabLine",
            }
        end,
    },
    win = {
        label = function(winid)
            return {
                "  " .. filename.unique(winid) .. " ",
                hl = "TabLine",
            }
        end,
    },
}

require 'tabby'.setup {
    tabline = line,
    nerdfont = true,
}

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
