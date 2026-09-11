return {
  -- Configure Mason to install your language servers
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        "gofumpt",
        "goimports",

        -- Angular/TypeScript
        "angular-language-server",
        "typescript-language-server",
        "prettier",

        -- C/C++
        "clangd",
        "clang-format",

        -- Java
        "jdtls",
      },
    },
  },

  -- Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Go LSP
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },

        -- Angular LSP
        angularls = {},

        -- TypeScript LSP
        ts_ls = {},

        -- C/C++ LSP
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
          },
        },

        -- Java LSP (basic config)
        jdtls = {},
    
       -- qml 
        qmlls = {
          mason = false,          -- stop mason-lspconfig from installing/expecting this
          cmd = { "qmlls" },      -- resolved via $PATH now that Mason's copy is gone
        },
      },
    },
  },
}
