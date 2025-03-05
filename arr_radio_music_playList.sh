#!/bin/bash
#execution:./arr_radio_music_playList.sh $1
#argument :$1 input_file(*.txt)
#author   :Kimihiro Abe
#attention:Don't forget to install nkf
#
#memo     :full-width to half-width(Zenkaku to Hankaku)
#         :NHK-FM's music playlist was in full-width characters, 
#         :so I decided to change it to half-width characters. :P
#created  :2025/02/04
#updated  :

# getFilename:change source
input_file="${1}" 

# String added to distinguish from source
convName="Converted"

# extension
ext=".txt"

# make output filename
output_file=$(echo $input_file | sed 's/.[^.]*$//')_$convName$ext

# process
cat $input_file | nkf -d -Z -W -w | sed 's/　/ /g' | sed 's/楽曲一覧/楽曲一覧\n/g' | sed 's/>/>\n/g'> ~/$output_file
sleep 1
chmod 755 ~/$output_file

# Result output
echo "output:$output_file complete! :P"

# file move: wsl to win11
# win_music_folder -> /mnt/c/Users/user/Music/
toFolder="win_music_folder" 
toOutput="/mnt/c/Users/user/Music"
mv ~/${output_file} ~/${toFolder}

if [ $? -eq 0 ];then
    echo "file move successfully!"
    echo "output here! -> ${toOutput}/${output_file}"
else
    echo "file move failed! :P"
fi
