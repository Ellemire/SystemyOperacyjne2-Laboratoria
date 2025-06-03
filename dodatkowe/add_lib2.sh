#!/bin/bash

# Domyślne wartości
CONF_FILE="postgresql.2.conf"
LIB_NAME="timescaledb"

# Parametry
while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--file)
      CONF_FILE="$2"
      shift 2
      ;;
    -l|--lib)
      LIB_NAME="$2"
      shift 2
      ;;
    -h|--help)
      echo "Użycie: $0 [--file ŚCIEŻKA] [--lib NAZWA_BIBLIOTEKI]"
      exit 0
      ;;
    *)
      echo "Nieznana opcja: $1"
      echo "Użycie: $0 [--file ŚCIEŻKA] [--lib NAZWA_BIBLIOTEKI]"
      exit 1
      ;;
  esac
done

# Sprawdzenie, czy plik istnieje
if [[ ! -f "$CONF_FILE" ]]; then
  echo "Błąd: Plik konfiguracyjny '$CONF_FILE' nie istnieje."
  exit 1
fi

# Wczytaj aktualną wartość shared_preload_libraries
LIB_LINE=$(tac "$CONF_FILE" | grep -m 1 -E "^[[:space:]]*shared_preload_libraries[[:space:]]*=[[:space:]]*'[^']*'")
echo "LIB_LINE: ${LIB_LINE}"

# Jeżeli nie znaleziono bibliotek
if [[ -z "$LIB_LINE" ]]; then
  echo "shared_preload_libraries = '${LIB_NAME}'" >> "$CONF_FILE"
  echo "Dodano nową linię shared_preload_libraries z biblioteką '$LIB_NAME'."

# Jeżeli plik zawiera zdeklarowne biblioteki
else
  EXISTING_LIBS=$(echo "$LIB_LINE" | grep -oP "'\K[^']*(?=')")          # Wyjęcie bibliotek z apostrofów
  REMOVED_LIBS=$(echo "$EXISTING_LIBS" | sed 's/[[:space:]]*,[[:space:]]*/,/g') # Usuwanie spacji
  echo "EXISTING_LIBS: $REMOVED_LIBS"

  # Sprawdź, czy biblioteka już istnieje
  if [[ "$REMOVED_LIBS" =~ (^|,)"$LIB_NAME"(,|$) ]]; then
    echo "Biblioteka '$LIB_NAME' już istnieje w shared_preload_libraries."

  # Jeżeli nie istnieje dodaj bibliotekę
  else
    UPDATED_LIBS=$(echo "$EXISTING_LIBS,$LIB_NAME")                     # Dodaje bibliotekę

    echo "shared_preload_libraries = '${UPDATED_LIBS}'" >> "$CONF_FILE" # Dopisywanie nowej linii
    echo "Zaktualizowano shared_preload_libraries, dodano '$LIB_NAME'."
  fi
fi
