return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    opts = {
      style = "moon", -- storm, moon, night, day
    },
  },
  { "EdenEast/nightfox.nvim" },

  {
    "oskarnurm/koda.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "koda",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
  },

  -- Set it as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ariadne",
    },
    --
  },
}
