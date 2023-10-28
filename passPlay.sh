#!/bin/sh
#execution: ./passPlay.sh
#auther   : Kimihiro Abe 
#
#extension: $1 desired file name
#
#explanation: Only the file name was listed in the documentation, 
#	      and I sometimes searched for logs based on that.
#	      I've only been using Linux for a while,
#	      so I created this shell for fun to get used to its operations. :)
#
#history  : 2023/10/28 first version uploaded

target=$1
extension=".log"


echo "----- Method 1 ------"

fullpath=$(find -name "$target.*")
echo "fullpath : $fullpath"

fullpathLeng=${#fullpath}
echo "fullpathLeng:$fullpathLeng"
echo ""

fullpath2=$(echo $fullpath | sed 's/\// /g')

pathArray=($fullpath2)
pathArrayLeng=${#pathArray[@]}
echo "pathArray : ${pathArray[@]}"
echo "pathArrayLeng : $pathArrayLeng"
echo ""

filename=${pathArray[$pathArrayLeng - 1]}
echo "filename : $filename"

filenameLeng=${#filename}
echo "filenameLeng : $filenameLeng"
echo ""

cutPosi=$((fullpathLeng - filenameLeng))
echo "cutPosi : $cutPosi"
echo ""

targetDirectory=$(echo $fullpath | cut -c "-$cutPosi")
echo "targetDirectory : $targetDirectory"

remainingPart=$(echo $fullpath | cut -c "$cutPosi-")
echo "remainingPart: $remainingPart"


