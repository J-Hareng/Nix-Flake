return {
  -- mason
{
  "mason-org/mason.nvim",
  opts = {
    PATH = "append",
    ensure_installed = {
      "clang-format",
      "prettier",
    },
  },
},
  -- Configure LSP servers
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      angularls = {},
      ts_ls = {},
      qmlls = { mason = false },
    },
  },
},
