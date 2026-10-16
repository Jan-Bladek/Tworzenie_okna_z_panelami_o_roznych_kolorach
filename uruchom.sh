#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$project_dir/src"
build_dir="$project_dir/build/classes"

if [[ -z "${DISPLAY:-}" ]]; then
    echo "Brak DISPLAY. Aplikacja Swing wymaga serwera X11/XWayland." >&2
    echo "Uruchom ją w lokalnej sesji graficznej albo skonfiguruj przekazywanie ekranu w kontenerze/SSH." >&2
    echo "Sesja Wayland: ${WAYLAND_DISPLAY:-brak}; Java Swing nadal potrzebuje DISPLAY (XWayland)." >&2
    exit 1
fi

if ! command -v javac >/dev/null 2>&1 || ! command -v java >/dev/null 2>&1; then
    echo "Nie znaleziono javac/java. Zainstaluj JDK i dodaj jego katalog bin do PATH." >&2
    exit 1
fi

mkdir -p "$build_dir"
find "$source_dir" -maxdepth 1 -name '*.java' -print0 | xargs -0 javac -encoding UTF-8 -d "$build_dir"
exec java -cp "$build_dir" GlownaAplikacja
