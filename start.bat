@echo off
cd /d "%~dp0"
echo Abriendo el juego en http://localhost:8000  (cerra esta ventana para apagar el servidor)
start "" http://localhost:8000
where py >nul 2>nul && (py -m http.server 8000 & goto :eof)
where python >nul 2>nul && (python -m http.server 8000 & goto :eof)
where npx >nul 2>nul && (npx --yes serve -l 8000 . & goto :eof)
echo No encontre Python ni Node.js. Instala Python desde python.org y volve a abrir este archivo.
pause
