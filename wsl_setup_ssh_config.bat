@echo off
if not defined distroarg call wsl_set_distro.bat
setlocal
set sshdir=%userprofile%\.ssh
if not exist "%sshdir%" mkdir "%sshdir%"
set sshconfig="%sshdir%\config"
set /p entryname=Enter name for ssh config entry (empty for wsl-x11): 
if not defined entryname set entryname=wsl-x11
echo.>> %sshconfig%
echo Host %entryname%>> %sshconfig%
echo 	Hostname localhost>> %sshconfig%
wsl %distroarg% whoami>username.txt
set /p wsluser=<username.txt
del username.txt
echo 	User %wsluser%>> %sshconfig%
echo 	ForwardX11 yes>> %sshconfig%
echo 	ForwardX11Trusted yes>> %sshconfig%
echo Config entry created.
echo -^> ssh %entryname%
endlocal
