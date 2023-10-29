#!/bin/sh
#execution: ./passPlayType2.sh
#auther   : Kimihiro Abe 
#
#extension: $1 desired file name
#
#explanation: I added an arrangement to the previous work(passPlay.sh).
#	      Since I'm still a shell beginner, 
#	      I also had to look at the previous work's description,
#	      so I committed it as a separate work. :P
#
#history  : 2023/10/29 first commit...Under construction  

#----- initial settings -----
target=$1
extension=".log"

#----- processing part -----
#get fullpath
fullpath=$(find -name $target$extension)
echo "fullpath : $fullpath"

#get filename with extension
filename=$(echo $fullpath | cut -d / -f 6)
echo "filename : $filename"
