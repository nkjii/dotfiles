return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup({
      -- デフォルト設定
      enable_close = true, -- タグの自動閉じ
      enable_rename = true, -- ペアのタグの自動リネーム
      enable_close_on_slash = false, -- 末尾の </ での自動閉じ

      -- 個別のファイルタイプ設定（これらはグローバルな "opts" 設定よりも優先されます）
      -- デフォルトは空です。特定のファイルタイプでグローバル設定がうまく機能しない場合に便利です。
      filetypes = {
        html = {
          enable_close = true,
        },
      },
    })
  end,
}
