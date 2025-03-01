#!/bin/sh
#Execution : ./sunriseSunsetCalendar.sh
#author : Kimihiro Abe
#explanation: I created a shell that retrieves sunrise and sunset information for Chiba Prefecture in japan. :)
#
#history:2023/10/27	First version uploaded
#

#basic process
curl -s https://eco.mtk.nao.ac.jp/koyomi/dni/2023/s1210.html.en |
tr '\n\r' '\t' |
sed 's/\n/\t/g' |
#sed 's/\t//g' |

#sentence trim
grep -oP '<div class="skipnav">.*<h3 class="hidden">' |
grep -oP 'Calendar.*' |
#grep -oP 'Chiba.*' |

#Cutting html elements
sed 's/<\/tr>/<\/tr>\n/g' |
sed 's/\s+/\t/g' |
sed 's/<[^>]*>//g' |

#cutting extra characters
sed 's/Calendar//g' |
sed 's/&nbsp//g' |
sed 's/&gt//g' |
sed 's/;;;//g' |
sed 's/RSS.*Japanese//g' |
sed 's/Prev.*Next//g' |
sed 's/Sunset.*)/Sunset/g' |
sed 's/Sunrise\/Sunset/Sunrise\/Sunset\n/g' |
sed 's/&deg;//g' |
sed 's/\[\]//g'|
sed 's/+9h/+9h\n/g' |
sed 's/Day/\n\nDay/g' |
sed 's/Set Azi\./Set Azi\.\n/g'

