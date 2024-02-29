#!/bin/bash
#execution	: ./changePermission_fileWithSpecifiedExtension.sh
#auther		: Kimihiro Abe


# パーミッション変更をする拡張子と目的のパーミッションを変数に設定
targetExtension=".json"
desired_perms="755"

# 特定の拡張子を持つファイルを検索し、それらのファイルのパーミッションをチェック
for file in *${targetExtension};
do
echo "$file" #Debug
  # ファイル存在チェック
  if [ -f "$file" ]; then
    # ファイルの現在のパーミッションを取得
    current_perms=$(stat -c "%a" "$file")
    # 現在のパーミッションが目的のパーミッションと異なる場合、パーミッションを変更
    if [ "$current_perms" != "$desired_perms" ]; then
      echo "Changing permissions of $file from $current_perms to $desired_perms"
      chmod $desired_perms "$file"
    fi
  fi
done