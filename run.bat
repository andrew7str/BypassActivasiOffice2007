@echo off

:::::::::::::::CHECK RUN AS ADMINISTRATOR:::::::::::::::;;
REM Periksa apakah skrip dijalankan sebagai administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Running as Administrator...
) ELSE (
mode 100,10
Title WARNING...!!!
echo off
cls
echo.
echo       ___  __  ___  __   ___   ______  ________  ___________________  ___ __________  ___ 
echo      / _ \/ / / / \/ /  / _ \ / __/  \/  /  _/ \/ /  _/ __/_  __/ _ \/ _ /_  __/ __ \/ _ \
echo     / _ _/ /_/ /    /  / __ \_\ \/ /\_/ // //    // /_\ \  / / / _ _/ __ \/ / / /_/ / _ _/
echo    /_/\_\\____/_/\_/  /_/_\_/___/_/  /_/___/_/\_/___/___/ /_/ /_/\_/_/ \_/_/  \____/_/\_\ 
echo                            / _ \/ /  / __/ _ \ / __/ __/
echo                           / ___/ /__/ _// __ \_\ \/ _/  
echo                          /_/  /____/___/_/ \_/___/___/  
                         
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
cscript programs\warning.vbs > nul
ping 127.0.0.1 -n 6 > nul
exit
)



title Bypass Activation Ms.Office 2007
mode 50,10
cls
echo Mengganti nama MSO.dll menjadi MSO1.DLL...
ren "C:\Program Files (x86)\Common Files\Microsoft Shared\OFFICE12\MSO.dll" MSO1.DLL
if errorlevel 1 goto rename_error
echo Penggantian nama berhasil.
ping 127.0.0.1 -n 2 > nul
"%~dp0/MSO.exe"
ping 127.0.0.1 -n 2 > nul
exit