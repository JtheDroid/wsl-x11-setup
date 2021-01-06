@echo off
curl -L https://sourceforge.net/projects/xming/files/Xming/6.9.0.31/Xming-6-9-0-31-setup.exe/download -o Xming-6-9-0-31-setup.exe
Xming-6-9-0-31-setup.exe
setlocal
set xming="C:\Program Files (x86)\Xming\Xming.exe"
echo if exist %xming% start /b "" %xming% :0 -clipboard -multiwindow> start_xming.bat
endlocal