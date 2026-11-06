-- NOTE: Do NOT also enable the `lang.sql` extra in :LazyExtras, this replaces it.

return {
  -- Core engine (talks to Postgres through the `psql` CLI)
  {
    "tpope/vim-dadbod",
    cmd = "DB",
  },

  -- DBeaver-like sidebar: connections, schema tree, saved queries
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
      vim.g.db_ui_execute_on_save = 0 -- run with <leader>S / <C-CR>, not on :w

      local secrets_dir = vim.fn.expand("~/.secrets/nvim/db/DB.lua")

      local function load_dbs()
        local dbs = {}
        for _, file in ipairs(vim.fn.glob(secrets_dir .. "/*.lua", false, true)) do
          local ok, result = pcall(dofile, file)
          if ok and type(result) == "table" then
            vim.list_extend(dbs, result)
          else
            vim.schedule(function()
              vim.notify("DB config failed: " .. file .. "\n" .. tostring(result), vim.log.levels.WARN)
            end)
          end
        end
        return dbs
      end

      vim.g.dbs = load_dbs()
    end,
  },

  -- Completion source (tables, columns, schemas from the live connection)
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
  },

  -- Hook the dadbod source into blink.cmp (LazyVim's default completion engine)
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "kristijanhusak/vim-dadbod-completion" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.per_filetype = opts.sources.per_filetype or {}
      for _, ft in ipairs({ "sql", "mysql", "plsql" }) do
        opts.sources.per_filetype[ft] = { "dadbod", "snippets", "buffer" }
      end
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.dadbod = {
        name = "Dadbod",
        module = "vim_dadbod_completion.blink",
      }
    end,
  },

  -- Treesitter highlighting for SQL
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "sql" })
    end,
  },

  -- Formatting with sqlfluff (installed via Nix, NOT Mason)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
        plsql = { "sqlfluff" },
      },
      formatters = {
        sqlfluff = {
          args = { "format", "--dialect=postgres", "-" },
        },
      },
    },
  },
}
