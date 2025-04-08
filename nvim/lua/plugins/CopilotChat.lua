return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, 
    },
    build = "make tiktoken",
    opts = {
      model = "claude-3.5-sonnet", -- モデル名を指定
      debug = true, -- デバッグを有効化
    }, 
}
