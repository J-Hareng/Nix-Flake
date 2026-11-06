return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 512,
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM", -- placeholder, Ollama needs no key
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:1.5b",
            optional = { max_tokens = 32, top_p = 0.9, stop = { "\n" } },
          },
        },
        virtualtext = { -- must be lowercase
          auto_trigger_ft = { "*" }, -- all filetypes
          keymap = {
            accept = "<S-Tab>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
}
