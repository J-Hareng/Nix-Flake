-- Add this to your lazy.nvim configuration
return {
  "praem90/db.nvim",
  config = function()
    local db_opts = dofile(vim.fn.expand("/home/ju/.secrets/nvim/db/HKA_POSTGRESS.lua"))

    require("db").setup({
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
      },
      main = "db",
      opts = db_opts,

      keys = {
        {
          "<leader>dbo",
          function()
            require("db").open()
          end,
          desc = "Open DB",
        },
        {
          "<leader>dbc",
          function()
            require("db").open_active_connections()
          end,
          desc = "Open Connections",
        },
        {
          "<leader>dbt",
          function()
            require("db").open_tables()
          end,
          desc = "Open Tables",
        },
        {
          "<leader>dbh",
          function()
            require("db").open_history()
          end,
          desc = "Open Tables",
        },
      },
    })
  end,
}
