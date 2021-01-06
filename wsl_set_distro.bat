@echo off
if not defined distro (
	wsl -l
	set /p distro="Enter WSL distribution name (empty for default): "
)
if defined distro (set distroarg=-d %distro%)else set distroarg= 
