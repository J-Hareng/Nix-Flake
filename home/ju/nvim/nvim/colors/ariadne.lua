-- ~/.config/nvim/colors/ariadne.lua
--
-- Ariadne colorscheme for Neovim (>= 0.8, uses nvim_set_hl)
-- Palette source: saneAspect's "Ariadne" GTK color-define scheme
--
-- Install:
--   1. Save this file as: ~/.config/nvim/colors/ariadne.lua
--      (create the "colors" folder if it doesn't exist yet)
--   2. In Neovim run:  :colorscheme ariadne
--   3. Or set it permanently in your init.lua:
--        vim.o.background = "dark"
--        vim.cmd.colorscheme("ariadne")

-- Reset any existing highlighting
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "ariadne"

---------------------------------------------------------------------
-- Palette (exact values from your @define-color scheme)
---------------------------------------------------------------------
local p = {
  bg0 = "#040e0d",
  bg1 = "#0a1816",
  bg2 = "#0f211f",
  bg3 = "#152a26",
  bg4 = "#1d3631",
  fg  = "#f5e2c5",

  red    = "#ff6048",
  orange = "#ffa478",
  yellow = "#f5cd5b",
  green  = "#7ad9a8",
  aqua   = "#3dd1b0",
  blue   = "#5fc8d4",
  purple = "#e89aa8",

  grey0 = "#302522", -- plum, used sparingly (non-text / special)
  grey1 = "#5a4d3e", -- muted, used for comments
  grey2 = "#c4b09a", -- soft fg, used for line numbers / secondary text

  none = "NONE",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

---------------------------------------------------------------------
-- Editor UI
---------------------------------------------------------------------
hl("Normal",        { fg = p.fg, bg = p.bg0 })
hl("NormalFloat",   { fg = p.fg, bg = p.bg1 })
hl("NormalNC",      { fg = p.fg, bg = p.bg0 })
hl("FloatBorder",   { fg = p.bg4, bg = p.bg1 })
hl("FloatTitle",    { fg = p.aqua, bg = p.bg1, bold = true })

hl("Cursor",        { fg = p.bg0, bg = p.fg })
hl("CursorLine",    { bg = p.bg2 })
hl("CursorLineNr",  { fg = p.yellow, bg = p.bg2, bold = true })
hl("CursorColumn",  { bg = p.bg2 })
hl("LineNr",        { fg = p.grey1 })
hl("SignColumn",    { fg = p.grey1, bg = p.bg0 })
hl("ColorColumn",   { bg = p.bg2 })

hl("Visual",        { bg = p.bg3 })
hl("VisualNOS",     { bg = p.bg3 })
hl("Search",        { fg = p.bg0, bg = p.yellow })
hl("IncSearch",     { fg = p.bg0, bg = p.orange })
hl("CurSearch",     { fg = p.bg0, bg = p.orange })

hl("StatusLine",    { fg = p.fg, bg = p.bg2 })
hl("StatusLineNC",  { fg = p.grey1, bg = p.bg1 })
hl("WinSeparator",  { fg = p.bg4 })
hl("VertSplit",     { fg = p.bg4 })

hl("Pmenu",         { fg = p.fg, bg = p.bg1 })
hl("PmenuSel",      { fg = p.bg0, bg = p.aqua, bold = true })
hl("PmenuSbar",     { bg = p.bg2 })
hl("PmenuThumb",    { bg = p.bg4 })
hl("PmenuBorder",   { fg = p.bg4, bg = p.bg1 })

hl("TabLine",       { fg = p.grey2, bg = p.bg1 })
hl("TabLineSel",    { fg = p.bg0, bg = p.aqua, bold = true })
hl("TabLineFill",   { bg = p.bg0 })

hl("FoldColumn",    { fg = p.grey1, bg = p.bg0 })
hl("Folded",        { fg = p.grey2, bg = p.bg2 })
hl("MatchParen",    { fg = p.orange, bold = true, underline = true })

hl("NonText",       { fg = p.grey0 })
hl("Whitespace",    { fg = p.bg4 })
hl("EndOfBuffer",   { fg = p.bg0 })
hl("Directory",     { fg = p.aqua })
hl("Title",         { fg = p.orange, bold = true })
hl("WildMenu",      { fg = p.bg0, bg = p.yellow })

---------------------------------------------------------------------
-- Syntax (classic groups — always active as a fallback)
---------------------------------------------------------------------
hl("Comment",       { fg = p.grey1, italic = true })

hl("Constant",      { fg = p.orange })
hl("String",        { fg = p.green })
hl("Character",     { fg = p.green })
hl("Number",        { fg = p.orange })
hl("Boolean",       { fg = p.orange, bold = true })
hl("Float",         { fg = p.orange })

hl("Identifier",    { fg = p.fg })
hl("Function",      { fg = p.aqua, bold = true })

hl("Statement",     { fg = p.purple, bold = true })
hl("Conditional",   { fg = p.purple })
hl("Repeat",        { fg = p.purple })
hl("Label",         { fg = p.purple })
hl("Operator",      { fg = p.grey2 })
hl("Keyword",       { fg = p.red })
hl("Exception",     { fg = p.red, bold = true })

hl("PreProc",       { fg = p.aqua })
hl("Include",       { fg = p.aqua })
hl("Define",        { fg = p.aqua })
hl("Macro",         { fg = p.aqua })
hl("PreCondit",     { fg = p.aqua })

hl("Type",          { fg = p.yellow })
hl("StorageClass",  { fg = p.yellow })
hl("Structure",     { fg = p.yellow })
hl("Typedef",       { fg = p.yellow })

hl("Special",       { fg = p.orange })
hl("SpecialChar",   { fg = p.orange })
hl("Tag",           { fg = p.purple })
hl("Delimiter",     { fg = p.grey2 })
hl("SpecialComment", { fg = p.grey1, italic = true })
hl("Debug",         { fg = p.red })

hl("Underlined",    { fg = p.blue, underline = true })
hl("Ignore",        { fg = p.grey1 })
hl("Error",         { fg = p.red, bold = true })
hl("Todo",          { fg = p.bg0, bg = p.yellow, bold = true })

---------------------------------------------------------------------
-- Diagnostics (LSP)
---------------------------------------------------------------------
hl("DiagnosticError", { fg = p.red })
hl("DiagnosticWarn",  { fg = p.yellow })
hl("DiagnosticInfo",  { fg = p.blue })
hl("DiagnosticHint",  { fg = p.aqua })
hl("DiagnosticOk",    { fg = p.green })

hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = p.yellow })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = p.blue })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = p.aqua })

hl("DiagnosticVirtualTextError", { fg = p.red, bg = p.bg1 })
hl("DiagnosticVirtualTextWarn",  { fg = p.yellow, bg = p.bg1 })
hl("DiagnosticVirtualTextInfo",  { fg = p.blue, bg = p.bg1 })
hl("DiagnosticVirtualTextHint",  { fg = p.aqua, bg = p.bg1 })

---------------------------------------------------------------------
-- Treesitter (@-groups, modern Neovim)
---------------------------------------------------------------------
hl("@variable",           { fg = p.fg })
hl("@variable.builtin",   { fg = p.red, italic = true })
hl("@variable.parameter", { fg = p.fg })
hl("@variable.member",    { fg = p.blue })

hl("@constant",           { fg = p.orange })
hl("@constant.builtin",   { fg = p.orange, bold = true })
hl("@string",             { fg = p.green })
hl("@string.escape",      { fg = p.orange, bold = true })
hl("@number",             { fg = p.orange })
hl("@boolean",            { fg = p.orange, bold = true })

hl("@function",           { fg = p.aqua, bold = true })
hl("@function.builtin",   { fg = p.aqua })
hl("@function.call",      { fg = p.aqua })
hl("@method",             { fg = p.aqua })
hl("@constructor",        { fg = p.yellow })

hl("@keyword",            { fg = p.red })
hl("@keyword.function",   { fg = p.red, italic = true })
hl("@keyword.return",     { fg = p.red, italic = true })
hl("@conditional",        { fg = p.purple })
hl("@repeat",             { fg = p.purple })
hl("@operator",           { fg = p.grey2 })

hl("@type",                { fg = p.yellow })
hl("@type.builtin",        { fg = p.yellow, italic = true })
hl("@property",            { fg = p.blue })
hl("@field",                { fg = p.blue })
hl("@parameter",            { fg = p.fg, italic = true })

hl("@comment",             { fg = p.grey1, italic = true })
hl("@punctuation.delimiter", { fg = p.grey2 })
hl("@punctuation.bracket",   { fg = p.grey2 })
hl("@tag",                  { fg = p.purple })
hl("@tag.attribute",        { fg = p.orange })
hl("@tag.delimiter",        { fg = p.grey2 })

---------------------------------------------------------------------
-- Common plugin support
---------------------------------------------------------------------

-- picker, so these groups affect both. SnacksPickerList is the
-- important one for the sidebar/tree background.
hl("SnacksPicker",             { fg = p.fg, bg = p.bg0 })
hl("SnacksPickerBorder",       { fg = p.bg4, bg = p.bg0 })
hl("SnacksPickerList",         { fg = p.fg, bg = p.bg0 })
hl("SnacksPickerListBorder",   { fg = p.bg4, bg = p.bg1 })
hl("SnacksPickerListTitle",    { fg = p.bg0, bg = p.aqua, bold = true })
hl("SnacksPickerListCursorLine", { bg = p.bg3 })
hl("SnacksPickerInput",        { fg = p.fg, bg = p.bg0 })
hl("SnacksPickerInputBorder",  { fg = p.bg4, bg = p.bg0 })
hl("SnacksPickerInputSearch",  { fg = p.orange })
hl("SnacksPickerPreview",      { fg = p.fg, bg = p.bg1 })
hl("SnacksPickerPreviewBorder",{ fg = p.bg4, bg = p.bg1 })
hl("SnacksPickerPreviewTitle", { fg = p.bg0, bg = p.green, bold = true })
hl("SnacksPickerBox",          { fg = p.fg, bg = p.bg1 })
hl("SnacksPickerBoxBorder",    { fg = p.bg4, bg = p.bg1 })
hl("SnacksPickerDir",          { fg = p.grey2 })
hl("SnacksPickerMatch",        { fg = p.orange, bold = true })
hl("SnacksPickerPrompt",       { fg = p.aqua })
 

-- gitsigns.nvim
hl("GitSignsAdd",    { fg = p.green })
hl("GitSignsChange", { fg = p.yellow })
hl("GitSignsDelete", { fg = p.red })

-- diff
hl("DiffAdd",    { bg = p.bg2, fg = p.green })
hl("DiffChange", { bg = p.bg2, fg = p.yellow })
hl("DiffDelete", { bg = p.bg2, fg = p.red })
hl("DiffText",   { bg = p.bg3, fg = p.fg })

-- telescope.nvim
hl("TelescopeBorder",        { fg = p.bg4 })
hl("TelescopeSelection",     { bg = p.bg2 })
hl("TelescopePromptTitle",   { fg = p.bg0, bg = p.aqua, bold = true })
hl("TelescopeResultsTitle",  { fg = p.bg0, bg = p.blue, bold = true })
hl("TelescopePreviewTitle",  { fg = p.bg0, bg = p.green, bold = true })

---------------------------------------------------------------------
-- Terminal (ANSI) colors — also useful as a reference when you
-- build the matching Ghostty theme in the next step
---------------------------------------------------------------------
vim.g.terminal_color_0 = p.bg1
vim.g.terminal_color_1 = p.red
vim.g.terminal_color_2 = p.green
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_4 = p.blue
vim.g.terminal_color_5 = p.purple
vim.g.terminal_color_6 = p.aqua
vim.g.terminal_color_7 = p.grey2
vim.g.terminal_color_8 = p.grey1
vim.g.terminal_color_9 = p.red
vim.g.terminal_color_10 = p.green
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_14 = p.aqua
vim.g.terminal_color_15 = p.fg
