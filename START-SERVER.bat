@echo off
chcp 65001 >nul
echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║           📚 BIBLIOTHÈQUE IA - MÉTHODE BMAD                   ║
echo ╠═══════════════════════════════════════════════════════════════╣
echo ║  Serveur démarré sur le réseau local (0.0.0.0:8080)           ║
echo ║                                                               ║
echo ║  Accès local :     http://localhost:8080                      ║
echo ║  Accès réseau :    http://VOTRE-IP:8080                       ║
echo ║                                                               ║
echo ║  Pour arrêter : Ctrl+C                                        ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Trouver l'IP locale
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
    goto :found
)
:found
echo 🌐 Votre IP réseau : %IP%
echo.

REM Ouvrir le navigateur automatiquement
start http://localhost:8080

REM Démarrer le serveur sur 0.0.0.0
python -m http.server 8080 --bind 0.0.0.0
