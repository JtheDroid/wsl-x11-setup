
if not defined distroarg wsl_set_distro.bat
setlocal
wsl %distroarg% mkdir -p $HOME/.ssh
set pubkeypath=%userprofile%\.ssh\id_rsb.pub
IF NOT EXIST "%pubkeypath%" ssh-keygen
IF EXIST "%pubkeypath%" type "%pubkeypath%" | wsl %distroarg% -- cat - ^>^> $HOME/.ssh/authorized_keys
endlocal