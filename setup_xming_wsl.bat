@echo off

call install_xming.bat
if exist start_xming.bat call start_xming.bat

call wsl_reinstall_ssh_server.bat
call wsl_setup_ssh_key.bat
call wsl_setup_ssh_config.bat

setx DISPLAY localhost:0.0