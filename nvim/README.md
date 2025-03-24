# pyrightにpoetryの環境を読み込ませるには
`pyproject.toml`に以下の記述を追加
```toml
[tool.pyright]
venvPath = "."
venv = ".venv"

[virtualenvs]
in-project = true
```

# github-copilotの利用
copilot用のLSPを別途手動でインストールする
```
# Copilot用ディレクトリの作成
mkdir -p ~/.config/nvim/copilot/

# Language Serverのインストール
npm install @github/copilot-language-server -g --prefix ~/.config/nvim/copilot/

# 実行権限の付与
chmod +x ~/.config/nvim/copilot/bin/copilot-language-server
```
