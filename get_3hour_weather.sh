#!/bin/bash
# execution: ./get_3hourWeather.sh
# auther	  : Kimihiro Abe
#
# explanation: Get today's 3 hour weather forecast from tenki,jp.
# 	      By changing the URL loaded with curl, 
#             you can get the 3-hour weather information for other regions.
#
# etc: I used Google Translate to translate the text into English. :P
#
# history: 2023/11/4 first commit 
#          2025/05/21 Fixed a bug that caused the site to not be able to be retrieved properly after updating.

# Find out in advance the location where you want to know the weather!
# Get "3-hour weather" for any area from tenki.jp
# Chiba city
curl -s https://tenki.jp/forecast/3/15/4510/12100/3hours.html |

# Cutting unnecessary parts 
tr '\n\r' '\t' |
sed 's/\t//g' |
grep -oP '<table id="forecast-point-3h-today" class="forecast-point-3h">.*<div class="forecast-radar-btn-box" id="forecast-radar-btn-box-1">' |
sed 's/<[^>]*>//g' |
sed -E 's/\s+/ /g' | #2,Here is an extended regular expression
sed -E 's/気温\(℃\).*index/気温\(℃\) /g' |

# Formatting sentences
sed 's/午前 午後 //' |
cut -c 21- | #This part was dealt with in a hurry. There may be room for consideration.
sed 's/] /]\n/g' |
sed 's/ 天気/\n天気/g' |
sed 's/ 気温/\n気温/g' |
sed 's/ 降水/\n降水/g' |
sed 's/ 湿度/\n湿度/g' |
sed 's/ 風向/\n風向/g' |
sed 's/ 風速/\n風速/g' |
sed 's/[ \t]*$//g' |
sed 's/ /\t/g' |

# If you want to output csv, comment out the following
sed 's/時刻\t//' |
sed 's/天気\t/天気\t\t/' |
sed 's/気温(℃)\t\t/気温\(℃\)\t/' |
sed 's/湿度(%)\t/湿度\(%\)\t\t/' |
sed 's/風向\t/風向\t\t/'
