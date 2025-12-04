# Ordner für versteckte Icon-Datei
$folder = "$env:LOCALAPPDATA\Mediconvey"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder | Out-Null
}

# Icon-Datei
$icon = Join-Path $folder "icon.ico"

# Icon herunterladen
Invoke-WebRequest `
    -Uri "https://github.com/DanielAntolic/mediconvey_public/raw/refs/heads/main/Mediconvey_Logo/mediconvey_win_logo.ico" `
    -OutFile $icon `
    -UseBasicParsing

# Desktop-Pfad ermitteln
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcut = Join-Path $desktop "MediConvey.url"

# Inhalt der Shortcut-Datei
$content = @"
[InternetShortcut]
URL=https://my.mediconvey.de/
IconFile=$icon
IconIndex=0
"@

# Shortcut erstellen
Set-Content -Path $shortcut -Value $content -Encoding ASCII -Force
