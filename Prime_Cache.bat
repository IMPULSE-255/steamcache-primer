@ECHO OFF

COLOR 0A

REM --------------------------------------------------------------------------------
REM Steamcache Primer for LAN Parties.
REM --------------------------------------------------------------------------------
REM Create an 'applist.txt' file with the steam app ID of each game you want cached
REM on a seperate line, the script with download and cache in order of the list.
REM --------------------------------------------------------------------------------

ECHO     _______________________________________________
ECHO   //                                              //
ECHO  //  Steamcache Primer - v1.0                    //
ECHO //______________________________________________//
ECHO.
PAUSE
SET /p STEAM_USERNAME=Please enter Steam Username : 
SET /p STEAM_PASSWORD=Please enter Steam Password : 
CLS
SET /p STEAM_GUARD=Please enter Steam Guard code (if applicable) : 
CLS
FOR /F "tokens=*" %%A in (applist.txt) DO ECHO app_license_request %%A >> ./script.cfg && ECHO app_update %%A validate >> ./script.cfg && ECHO app_uninstall -complete %%A >> ./script.cfg
STEAMCMD.exe +login %STEAM_USERNAME% %STEAM_PASSWORD% %STEAM_GUARD% +@sSteamCmdForcePlatformType windows +force_install_dir ./tmp +runscript script.cfg +quit
DEL script.cfg
ECHO.
ECHO Complete.
PAUSE
