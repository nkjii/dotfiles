return {
  "yetone/avante.nvim",
  event = "VeryLazy",
    lazy = false,
    version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua"
  },
  opts = {
    provider = "copilot",
        -- provider = "claude",
        -- provider = "openai",
    auto_suggestions_provider = "copilot",
    copilot = {
          endpoint = "https://api.githubcopilot.com",
          model = "claude-3.5-sonnet",
          proxy = nil, -- [protocol://]host[:port] Use this proxy
          allow_insecure = false, -- Allow insecure server connections
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          max_tokens = 20480,
      },
  },
}
