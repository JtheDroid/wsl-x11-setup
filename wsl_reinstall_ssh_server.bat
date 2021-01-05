@echo off
if not defined distroarg wsl_set_distro.bat
wsl %distroarg% -u root apt update ^&^& apt remove openssh-server ^&^& apt install openssh-server -y