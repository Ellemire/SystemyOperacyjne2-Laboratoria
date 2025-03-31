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
# Zadanie 7.
# Odnaleźć plik w katalogu `dane/kontrola/`, którego zawartość pokrywa się
# z wnętrzem pliku `dane/poszukiwany`. Jako wynik, wyświetlić wyłącznie nazwę
# pasującego pliku. Jeśli takiego pliku nie ma, nie wyświetlać zupełnie nic.
# Proszę pamiętać o każdorazowym upewnieniu się, że zawartość pliku możemy
# przeczytać (mamy prawo do odczytu – aby uniknąć błędów).
#

for plik in "dane/kontrola"/*
do
    if [ -f "$plik" ] && [ -r "$plik" ]
    then
        if cmp -s "$plik" "dane/poszukiwany"; then
            echo "$(basename "$plik")"
            exit 0 
        fi
    fi
done

exit 0

