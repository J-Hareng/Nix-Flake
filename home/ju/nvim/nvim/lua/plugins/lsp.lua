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
        gopls = { mason = false },
        clangd = {
          mason = false,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver=/nix/store/*/bin/*,/run/current-system/sw/bin/*,/etc/profiles/per-user/*/bin/*",
          },
        },
      },
    },
  },
}
