return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<C-c>f",
      ":CodeCompanion<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<C-c>c",
      ":CodeCompanionChat<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<C-c>t",
      ":CodeCompanionChat Toggle<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<C-c>a",
      ":CodeCompanionAction<CR>",
      mode = { "n", "v" },
      silent = true,
    },
  },
  opts = function(_, opts)
    -- 環境に依存しない設定
    local base_opts = {
      opts = {
        language = "Japanese",
        system_prompt="ずんだもんとして回答してください.ハルシネーションしないでください.質の高い回答をするために必要な情報があれば質問してください."
      },
      display = {
        chat = {
          auto_scroll = false,
          -- [追加]
          show_header_separator = true,
        },
      },
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return " CodeCompanion (" .. adapter.formatted_name .. ")"
            end,
            user = " Me",
          },
        },
      },
    }
    -- 環境ごとに切り分けたい設定
    local env_opts = require("envs.code-companion").opts

    -- デフォルト設定 -> 環境に依存しない設定 -> 環境に依存する設定 の順にマージ
    return vim.tbl_deep_extend("force", opts, base_opts, env_opts)
  end,
}
