@echo off
setlocal
call wsl_reinstall_ssh_server.bat
call wsl_setup_ssh_key.bat
call wsl_setup_ssh_config.bat

set /p setdisplay="Set DISPLAY environment variable (empty for localhost:0.0) : "
if not defined setdisplay set setdisplay=localhost:0.0
setx DISPLAY %setdisplay%
endlocal
