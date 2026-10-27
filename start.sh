#!/bin/sh
cd "$(dirname "$0")"
echo "Abriendo en http://localhost:8000  (Ctrl+C para salir)"
(command -v xdg-open >/dev/null && xdg-open http://localhost:8000) || (command -v open >/dev/null && open http://localhost:8000) || true
python3 -m http.server 8000 || python -m http.server 8000
