#!/bin/sh
#execution	: ./formatFromCSV_toTextFile.sh var1 var2 
#var1		: CSV file　name(xxxxx.csv)
#var2		: output text file name(yyyyy.txt)
#auther		: Kimihiro Abe
#memo		: Format from csv and output to text
#memo		: 1.Give comma-delimited CSV as var1.
#memo		: 2,Give the name of the text file you want to output as var2.
#memo		: Preparations such as putting multiple columns of entries into one cell.
#memo		: CSVファイルを一度メモ帳に読ませ、UTF-8で保存し直したものをシェルに読み込ませることで、出力ファイルの文字化けを防ぐことが出来る。

#line=$(iconv -f SHIFT-JIS -t UTF-8 $1)
line=$1
touch $2
count=0

while read line
do
	#[,] -> [ ]
	formattedLine=`echo $line | sed 's/,/ /g'`
	
	#Arraying
	formattedLineArray=($formattedLine)
	#echo ${formattedLineArray[3]} #Debug :p
	
	#Shaping process
	#Cut unnecessary information at the beginning with an if statement. 
	#If you prepare the CSV first, you may not need an if statement. :P
	if [ $count -ne 1 ]; then
		echo 西暦:${formattedLineArray[2]} >> $2
		echo 町丁名:${formattedLineArray[3]} >> $2
		echo "人口(男)":${formattedLineArray[6]} >> $2
		echo "人口(女)":${formattedLineArray[7]} >> $2
		echo "人口(総数)":${formattedLineArray[5]} >> $2
		echo "世帯数":${formattedLineArray[4]} >> $2
		echo "" >> $2
	fi
	
	#Processing that does not output unnecessary lines at the beginning. You can change it as you like! :)
	if [ $count -le 1 ]; then
		((count++))
		#echo $count #Debug :p
	fi
	
done < $1