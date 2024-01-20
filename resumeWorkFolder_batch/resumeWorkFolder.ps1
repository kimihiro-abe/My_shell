# 月～金の間はPCつけっぱで、金曜日にPC電源を落とす時などに、
# resumeWorkFolderList.txtに作業途中のフォルダや開いていたエクセルのパスを記載しておき、
# 作業再開時にこのバッチファイルをダブルクリックして楽するメソッド
#
# 実行方法 ： resumeWork.ps1とresumeWork.txtを同じ階層に置き、
# 実行方法 ： ./resumeWork.ps1

foreach($line in Get-Content resumeWorkFolderList.txt) {
    explorer.exe $line
}