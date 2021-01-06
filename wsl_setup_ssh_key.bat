@echo off
if not defined distroarg call wsl_set_distro.bat
setlocal
wsl %distroarg% mkdir -p $HOME/.ssh
set pubkeypath=%userprofile%\.ssh\id_rsa.pub
if not exist "%pubkeypath%" (
	echo .ssh\id_rsa.pub not found, generating key...
	ssh-keygen
)
echo Adding key to .ssh/authorized_keys...
if exist "%pubkeypath%" type "%pubkeypath%" | wsl %distroarg% -- cat - ^>^> $HOME/.ssh/authorized_keys
echo Adding host key to .ssh\known_hosts...
ssh-keyscan -t ecdsa localhost 2>nul >> "%userprofile%\.ssh\known_hosts"
endlocal
