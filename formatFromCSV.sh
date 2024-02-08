#!/bin/sh
#execution	: ./formatFromCSV.sh var1 var2 
#var1		: CSV file　name(xxxxx.csv)
#var2		: output text file name(yyyyy.txt)
#auther		: Kimihiro Abe
#memo		: Format from csv and output to text
#memo		: Preparations such as putting multiple columns of entries into one cell.
#memo		: CSVファイルを一度メモ帳に読ませ、UTF-8で保存し直したものをシェルに読み込ませることで、出力ファイルの文字化けを防ぐことが出来る。
#ディレクトリ内にある、全xmlファイル内のyearの箇所を置換する

#line=$(iconv -f SHIFT-JIS -t UTF-8 $1)
line=$1
touch $2

while read line
do
	#一行を「,」で分割し、分割した項目数の幾つ目かを指定することで、目的の文字列を抜き出す
	#cut -d 区切り文字 -f 項目数
	col1=$(echo ${line} | cut -d , -f 1)
	col2=$(echo ${line} | cut -d , -f 2)
	col3=$(echo ${line} | cut -d , -f 3)
	col4=$(echo ${line} | cut -d , -f 4)
	col5=$(echo ${line} | cut -d , -f 5)
	col6=$(echo ${line} | cut -d , -f 6)
	col7=$(echo ${line} | cut -d , -f 7)
	col8=$(echo ${line} | cut -d , -f 8)

	echo 西暦:$col3 >> $2
	echo 町丁名:$col4 >> $2
	echo "人口(男)":$col7 >> $2
	echo "人口(女)":$col8 >> $2
	echo "人口(総数)":$col6 >> $2
	echo "世帯数":$col5 >> $2
	echo "" >> $2
done < $1