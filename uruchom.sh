#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$project_dir/src"
build_dir="$project_dir/build/classes"

if [[ -n "${FLATPAK_ID:-}" ]]; then
    echo "Uruchom ten skrypt z terminala pulpitu, poza IntelliJ z Flatpaka." >&2
    echo "Flatpak może odciąć aplikację Swing od autoryzacji X11." >&2
    exit 1
fi

if [[ -z "${DISPLAY:-}" ]]; then
    echo "Brak DISPLAY. Aplikacja Swing wymaga serwera X11/XWayland." >&2
    echo "Uruchom ją w lokalnej sesji graficznej albo skonfiguruj przekazywanie ekranu w kontenerze/SSH." >&2
    echo "Sesja Wayland: ${WAYLAND_DISPLAY:-brak}; Java Swing nadal potrzebuje DISPLAY (XWayland)." >&2
    exit 1
fi

if [[ -n "${JAVA_HOME:-}" && -x "$JAVA_HOME/bin/java" && -x "$JAVA_HOME/bin/javac" ]]; then
    java_bin="$JAVA_HOME/bin/java"
    javac_bin="$JAVA_HOME/bin/javac"
elif [[ -x "$HOME/.jdks/openjdk-27/bin/java" && -x "$HOME/.jdks/openjdk-27/bin/javac" ]]; then
    java_bin="$HOME/.jdks/openjdk-27/bin/java"
    javac_bin="$HOME/.jdks/openjdk-27/bin/javac"
elif command -v java >/dev/null 2>&1 && command -v javac >/dev/null 2>&1; then
    java_bin="$(command -v java)"
    javac_bin="$(command -v javac)"
else
    echo "Nie znaleziono JDK. Ustaw JAVA_HOME lub zainstaluj JDK w ~/.jdks/openjdk-27." >&2
    exit 1
fi

mkdir -p "$build_dir"
find "$source_dir" -maxdepth 1 -name '*.java' -print0 | xargs -0 "$javac_bin" -encoding UTF-8 -d "$build_dir"
exec "$java_bin" -cp "$build_dir" GlownaAplikacja
