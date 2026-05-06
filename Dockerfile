# =====================================================================
# Dockerfile fuer unsere Flask Mini-Webapp
# Wird Zeile fuer Zeile von "docker build" abgearbeitet.
# =====================================================================

# 1) Basis-Image: ein winziges Linux mit Python 3.12 vorinstalliert.
#    "slim" = abgespeckte Variante (kleiner, sicherer als die Full-Version).
FROM python:3.12-slim

# 2) Arbeitsverzeichnis im Container. Alle folgenden Befehle laufen hier drin.
#    Wenn der Ordner nicht existiert, wird er angelegt.
WORKDIR /app

# 3) Erst nur die Einkaufsliste reinkopieren (NICHT den ganzen Code).
#    Trick: Solange sich requirements.txt nicht aendert, kann Docker
#    den naechsten Schritt aus dem Cache nehmen -> spart viel Build-Zeit.
COPY requirements.txt .

# 4) Pakete installieren.
#    --no-cache-dir spart Plattenplatz im Image.
RUN pip install --no-cache-dir -r requirements.txt

# 5) Jetzt erst den restlichen App-Code reinkopieren.
COPY . .

# 6) Doku-Hinweis: Container lauscht spaeter auf Port 5000.
#    (Oeffnet noch keinen Port - das passiert beim "docker run -p ...".)
EXPOSE 5000

# 7) Startbefehl, wenn der Container hochfaehrt.
#    Form ["..","..","..."] = "exec form" (empfohlen, kein Shell-Wrapper).
CMD ["python", "app.py"]
