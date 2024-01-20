rem 月～金の間はPCつけっぱで、金曜日にPC電源を落とす時などに、
rem resumeWorkFolderList.txtに作業途中のフォルダや開いていたエクセルのパスを記載しておき、
rem 作業再開時にこのバッチファイルをダブルクリックして楽するメソッド

@echo off
for /f %%a in (resumeWorkFolderList.txt) do (
  explorer.exe "%%a"
)