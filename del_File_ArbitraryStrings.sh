#!/bin/sh
#execution	: ./deleteFiles_With_ArbitraryStrings.sh
#auther		: Kimihiro Abe
#memo		: Delete files that contains a string set in an array

#Strings to be deleted
targetArray=("削除" "ゴミ" "撤退" "廃止" "不要" "不使用" "test" "bkup" ".log")

#targetArrayLength
targetArrayLength=${#targetArray[@]}

# Read from the array and delete in a loop
for (( i=0; i<$targetArrayLength; i++ ))
do
  # deletingProcessingMain

  str=${targetArray[$i]}

  # Find and delete files containing strings from the current directory
  find . -type f -name "*$str*" -exec rm -f {} \;
done

#Deletion Completion Message
echo "targetArray [${targetArray[@]}] Deleted files containing"