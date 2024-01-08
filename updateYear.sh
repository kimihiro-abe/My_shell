#!/bin/sh
#execution	: ./updateYear.sh
#auther		: Kimihiro Abe
#memo		: for Audacity meta data
#ディレクトリ内にある、全xmlファイル内のyearの箇所を置換する
sed -s -i s/2023/2024/g *.xml