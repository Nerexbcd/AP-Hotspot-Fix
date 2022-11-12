@echo off

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

IF NOT EXIST %appdata%\APHotspotFix (
	mkdir %appdata%\APHotspotFix
	echo.
)

cd %appdata%\APHotspotFix

:menu
cls
echo AP Hotspot Fix
echo.
echo Created by APascoa.
echo.
echo MENU:
echo [1] Fix the Hotspot
echo [2] Restore Default (recomende after playing) 
echo [3] Change Wireless Interface 
echo [4] Exit
echo.


set /p Input=Choose(1/2/3/4): 

If /I "%Input%"=="1" goto 1
If /I "%Input%"=="2" goto 2
If /I "%Input%"=="3" goto 3
If /I "%Input%"=="4" goto 4
goto other

:1
cls
echo AP Hotspot Fix
echo.
echo Created by APascoa.
echo.
IF NOT EXIST ".\interface.txt" (
	echo Plz Configure the interface first!!
	pause
	goto menu
)
set /p "interfacename="<"interface.txt"
echo Activate the VR Hotspot Fix
echo.
echo Current Wireless Interface: %interfacename%
netsh wlan disconnect
timeout 2
netsh wlan set autoconfig enabled=no interface="%interfacename%"
pause
goto menu

:2
cls
echo AP Hotspot Fix
echo.
echo Created by APascoa.
echo.
IF NOT EXIST ".\interface.txt" (
	echo Plz Configure the interface first!!
	pause
	goto menu
)
set /p "interfacename="<"interface.txt"
echo Deactivate VR Hotspot Fix 
echo.
echo Current Wireless Interface: %interfacename%
netsh wlan set autoconfig enabled=yes interface="%interfacename%"
pause
goto menu


:3
cls
echo AP Hotspot Fix
echo.
echo Created by APascoa.
echo.
echo Change Interface
echo.
netsh interface show interface
set /P "interface=Please copy-paste your wifi interface's name from the last column: "
echo.
echo %interface%>.\interface.txt
pause
goto menu


:4
exit

:n
cls
goto menu

:other
echo.
echo Sorry, that's not an option!
echo.
pause
cls
goto menu