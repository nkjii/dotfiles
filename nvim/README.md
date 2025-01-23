# pyrightにpoetryの環境を読み込ませるには
`pyproject.toml`に以下の記述を追加
```toml
[tool.pyright]
venvPath = "."
venv = ".venv"

[virtualenvs]
in-project = true
```
