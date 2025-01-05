#!/bin/bash

# 元のディレクトリ
SOURCE_DIR=$1
# リンク先のディレクトリ
TARGET_DIR=$2

if [[ ! -d "$SOURCE_DIR" || ! -d "$TARGET_DIR" ]]; then
  echo "Usage: $0 <source_dir> <target_dir>"
  echo "Both arguments must be valid directories."
  exit 1
fi

# 再帰的にファイル・ディレクトリをシンボリックリンクで作成
find "$SOURCE_DIR" -mindepth 1 -print0 | while IFS= read -r -d '' file; do
  # リンクのパスを計算
  relative_path="${file#$SOURCE_DIR/}"
  target_path="$TARGET_DIR/$relative_path"

  # 必要に応じてターゲットディレクトリを作成
  mkdir -p "$(dirname "$target_path")"

  # シンボリックリンクを作成
  ln -s "$file" "$target_path"
done

