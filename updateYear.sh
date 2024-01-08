#!/bin/sh
#execution	: ./updateYear.sh
#auther		:	Kimihiro Abe
#ディレクトリ内にある、全xmlファイル内のyear表記を置換する
sed -s -i s/2023/2024/g *.xml