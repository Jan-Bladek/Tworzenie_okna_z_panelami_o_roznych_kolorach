# Kolorowe panele — Java Swing na Linuksie

## Uruchomienie

Wymagane jest JDK oraz aktywna sesja graficzna. Uruchom z terminala pulpitu:

```bash
./uruchom.sh
```

Skrypt kompiluje pliki z `src/` do `build/classes/` i uruchamia aplikację. Wykrywa JDK z `JAVA_HOME`, `~/.jdks/openjdk-27` lub `PATH`.

## Błąd `HeadlessException` / `No X11 DISPLAY variable was set`

Swing wymaga dostępu do X11. Na pulpicie Wayland zapewnia go zwykle XWayland; samo `WAYLAND_DISPLAY` nie wystarcza. Uruchom aplikację w lokalnej sesji graficznej i sprawdź `echo "$DISPLAY"`.

Jeśli IntelliJ IDEA jest zainstalowane jako Flatpak, uruchom `./uruchom.sh` w terminalu pulpitu poza IntelliJ. Flatpak może odciąć proces Java od ciasteczka autoryzacji X11. Samo wpisanie `DISPLAY=:0` nie rozwiązuje autoryzacji.

Przy SSH użyj przekazywania X11 (`ssh -X` lub `ssh -Y`) i skonfiguruj serwer X11 po stronie klienta. W Dockerze trzeba przekazać socket X11 i autoryzację.

## IntelliJ IDEA

Projekt można też otworzyć w IntelliJ i uruchomić klasę `GlownaAplikacja`. Jeśli pojawia się błąd połączenia z X11, uruchom skrypt z terminala pulpitu: `./uruchom.sh`.
