-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
---- Custom cursor color (override colorscheme cursor)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Change these hex codes to whatever color you want
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#1a1b26", bg = "#c0caf5" }) -- Blue cursor
    vim.api.nvim_set_hl(0, "lCursor", { fg = "#1a1b26", bg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "CursorIM", { fg = "#1a1b26", bg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "TermCursor", { fg = "#1a1b26", bg = "#c0caf5" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {

  pattern = { "qml", "qmljs" },
  callback = function()
    vim.lsp.enable("qmlls")
  end,

})
-- Apply immediately
vim.api.nvim_set_hl(0, "Cursor", { fg = "#1a1b26", bg = "#c0caf5" })
