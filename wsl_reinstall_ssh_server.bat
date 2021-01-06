@echo off
echo Reinstalling ssh server...
if not defined distroarg call wsl_set_distro.bat
wsl %distroarg% -u root apt update ^&^& apt remove openssh-server -y ^&^& apt install openssh-server -y
wsl %distroarg% -u root service ssh --full-restart
