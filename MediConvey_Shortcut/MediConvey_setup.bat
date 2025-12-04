::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD9VQg2HMFeeCbYJ5e31+/m7j0gZXeEwdpnew4ijJeQayUrqY5M06ndfnMIPAxVOewuUeQY6lmJNsWvLPsST0w==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF25
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD9VQg2HMFeeCbYJ5e31+/m7j0gZXeEwdpnew4ijJeQayUrqY5M06ldfnMIvAxVOewvlex0452taswQ=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
REM MediConvey Desktop Shortcut Installer (no admin rights needed)

REM Ziel-URL
set "targetUrl=https://my.mediconvey.de/"

REM Versteckter Speicherort für das Icon
set "folder=%LOCALAPPDATA%\Mediconvey"

if not exist "%folder%" (
    mkdir "%folder%"
)

REM Icon-Datei lokal speichern
set "icon=%folder%\icon.ico"

REM Icon von GitHub herunterladen
powershell -Command "try { Invoke-WebRequest 'https://github.com/DanielAntolic/mediconvey_public/raw/refs/heads/main/Mediconvey_Logo/mediconvey_win_logo.ico' -OutFile '%icon%' -UseBasicParsing } catch { Write-Host 'Fehler beim Laden des Icons.' }"

REM Desktop-Pfad des aktuellen Benutzers
set "desktop=%USERPROFILE%\Desktop"
set "shortcut=%desktop%\MediConvey.url"

REM Shortcut erstellen
(
    echo [InternetShortcut]
    echo URL=%targetUrl%
    echo IconFile=%icon%
    echo IconIndex=0
) > "%shortcut%"

echo.
echo Die MediConvey-Verknuepfung wurde erfolgreich auf dem Desktop erstellt.
echo Dieses Fenster schliesst sich automatisch in 3 Sekunden...
timeout /t 3 >nul
exit

