#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 5.
# Odnaleźć nazwy plików z katalogu `dane/icao/`, których brakuje w katalogu
# `dane/backup/`. Nie zwracamy uwagi na zawartość ani ustawienia istniejących
# plików, porównujemy tylko ich nazwy. Każdą nazwę wyświetlić w osobnej linii.
#

for plik in dane/icao/*
do
    nazwa_pliku=$(basename "$plik")
    if [ ! -e "dane/backup/$nazwa_pliku" ]; then
        echo "$nazwa_pliku"
    fi
done