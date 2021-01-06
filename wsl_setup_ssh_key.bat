@echo off
if not defined distroarg call wsl_set_distro.bat
setlocal
wsl %distroarg% mkdir -p $HOME/.ssh
set pubkeypath=%userprofile%\.ssh\id_rsa.pub
if not exist "%pubkeypath%" ssh-keygen
if exist "%pubkeypath%" type "%pubkeypath%" | wsl %distroarg% -- cat - ^>^> $HOME/.ssh/authorized_keys
ssh-keyscan -t ecdsa localhost 2>nul >> "%userprofile%\.ssh\known_hosts"
rem wsl %distroarg% ssh-keyscan -t ecdsa localhost 2^>/dev/null>known_hosts_wsl.txt
rem echo.>>"%userprofile%\.ssh\known_hosts"
rem type known_hosts_wsl.txt >> "%userprofile%\.ssh\known_hosts"
rem del known_hosts_wsl.txt
endlocal
