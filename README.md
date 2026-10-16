# Kolorowe panele — Java Swing na Linuksie

## Uruchomienie

Wymagane jest JDK (polecenia `java` i `javac`) oraz aktywna sesja graficzna. W katalogu projektu uruchom:

```bash
./uruchom.sh
```

Skrypt kompiluje pliki z `src/` do `build/classes/` i uruchamia aplikację.

## Błąd `HeadlessException` / `No X11 DISPLAY variable was set`

To nie jest błąd układu okna. Proces Javy nie widzi serwera graficznego. Swing na Linuksie potrzebuje X11; na pulpicie Wayland zapewnia go zwykle XWayland. Zmienna `WAYLAND_DISPLAY` sama nie wystarcza.

1. Uruchom aplikację w zwykłej, lokalnej sesji pulpitu. Sprawdź w terminalu: `echo "$DISPLAY"`. W sesji graficznej wartość zwykle wygląda jak `:0` albo `:1`.
2. W IntelliJ IDEA sprawdź **Run → Edit Configurations**: usuń `-Djava.awt.headless=true`, jeśli występuje, i uruchom konfigurację na komputerze z pulpitem. Nie uruchamiaj procesu w środowisku headless ani z odłączonym/nieprzekazanym ekranem.
3. W sesji Wayland sprawdź, czy zainstalowany i uruchomiony jest XWayland. Sama obecność `WAYLAND_DISPLAY` nie uruchomi Swinga.
4. Przy SSH użyj przekazywania X11 (`ssh -X` lub `ssh -Y`) i skonfiguruj serwer X11 po stronie klienta. W Dockerze/Flatpaku trzeba osobno przekazać socket X11 i uprawnienia.

`uruchom.sh` wypisuje wskazówkę, jeśli `DISPLAY` nie jest ustawione. Aplikacji okienkowej nie da się wyświetlić na maszynie bez serwera graficznego; w takim przypadku potrzebny jest pulpit z XWayland albo prawidłowo skonfigurowane przekazywanie ekranu.

## IntelliJ IDEA

Projekt można również otworzyć w IntelliJ i uruchomić klasę `GlownaAplikacja`. Ustaw JDK projektu na zainstalowane JDK. Uruchomienie z terminala w projekcie (`./uruchom.sh`) pozwala odróżnić problem konfiguracji IDE od problemu sesji graficznej.
