#!/bin/sh
#execution	: ./updateYear.sh
#auther		: Kimihiro Abe
#memo		: for Audacity meta data
#           : ディレクトリ内にある、全xmlファイル内のyearの箇所を置換する
#created    : 2024/01/09
#updated    : 2026/01/04

# 今年の西暦
thisyear=$(date +%Y)

# 昨年の西暦
lastyear=$((thisyear - 1))

echo "Replacing $lastyear → $thisyear ..."

# 置換処理
sed -s -i "s/$lastyear/$thisyear/g" *.xml

echo "Done!"
