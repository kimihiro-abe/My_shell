#!/bin/bash
#execution:./make_memo_one_line.sh $1
#argument :$1(one line text)
#author   :Kimihiro Abe
#attention:
#memo     :I created this tool because...
#         :I sometimes want to take notes without starting vim. :P
#         :
#         :I think it will be more convenient to use 
#         :if you create a symbolic link as shown below. :)
#         :ln -s make_memo_one_line.sh mm
#created  :2025/02/11
#updated  :


# date
date_YYYYmmdd=$(date '+%Y/%m/%d')
date_HHMMSS=$(date '+%H:%M:%S')
date_filename=$(date '+%Y_%m%d')

# input line
line="${1}"

# export file name    memo_2025_0301.txt
exp_file="memo_${date_filename}.txt"

# export dir
# Please set the memo directory as you like.
exp_dir="${HOME}"

# check file existence
# If a file exists for that day, additional information is added to that file.
if [[ ! -f "${exp_file}" ]];then
    echo -e "${date_YYYYmmdd}" > "${exp_dir}/${exp_file}"
    echo -e "${date_HHMMSS}# ${line}" >> "${exp_dir}/${exp_file}" 
else
    echo -e "${date_HHMMSS}# ${line}" >> "${exp_dir}/${exp_file}" 
fi

