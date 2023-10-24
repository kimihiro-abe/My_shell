#!/bin/sh
#実行環境：./createMailBody01a_gotoWork.sh

#日付、時刻、曜日の取得。曜日は数値として取得
#dateArray=(`date +"%m/%d %H:%M %u"`) #これでも通る
dateArray=($(date +'%m/%d %H:%M %u'))

#曜日の文字列代入　dow = day of week
dowArray=("月" "火" "水" "木" "金" "土" "日")
dayOfWeek=${dowArray[${dateArray[2]} - 1]}

#文章を配列に入れる。段落にすると見やすい
#勤務開始時に遅れることはホボないので始業時間を決め打ち＾＾；
lines=(
"おはようございます。xxxxです。\n"
"日付：${dateArray[0]}($dayOfWeek)"
"時間：9:00"
"勤務区分：在宅\n"
"以上です"
"本日も一日よろしくお願いいたします。"
)

#テキストファイルへの出力処理
count=0 #カウンター用変数
for line in ${lines[@]}
do
	# [ と ] の間のスペースは以下のようにしないとエラー出る
	if [ $count -eq 0 ]; then
		#ループ初回は、ファイルに出力。echoの[-e]オプションでエスケープシーケンスを解釈できる
		echo -e $line > 勤怠_出勤時メール文面.txt
	else
		#ループの初回以外は、ファイルに追記
		echo -e $line >> 勤怠_出勤時メール文面.txt
	fi
	((count++))
	#count=`expr $count + 1` この表記は実行速度が遅いらしい
done
