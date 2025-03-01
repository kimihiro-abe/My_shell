#!/bin/sh
#execution	: ./updateYear.sh
#auther		: Kimihiro Abe
#memo		: for Audacity meta data
#           : ディレクトリ内にある、全xmlファイル内のyearの箇所を置換する
#created    : 2024/01/09
#updated    : 2025/03/02

sed -s -i s/2024/2025/g *.xml