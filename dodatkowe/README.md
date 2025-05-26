# Zad 1

Ostatni slajd w prezentacji https://datko.pl/SO2/lab4.pdf. max +0.05. Oczekuje jedynie pdf'a z wyjaśnieniem, + może ze dwa przykłady w kodzie.

# Zad 2

Max +0.2 w górę należy zadanie zaprezentować na labach bądź umówić się na konsultacje.

Należy napisać skrypt w bashu (pozostawiam wam dowolność czy użyjecie sed'a, awk czy innego programu), który doda bibliotekę timescaledb do pliku konfiguracyjnego bazy danych postgresql.conf (plik konfiguracyjny w załączniku). Czego oczekuję w tym skrypcie:

- mogę podać ścieżkę do pliku konfiguracyjnego

- mogę łatwo zmieniać nazwę biblioteki jaką chcę dodać

- skrypt ma zezwalać na jego wielokrotne wykonywanie bez szkody na konfigurację serwera

- Skrypt upewnia się, że wpis shared_preload_libraries zawierający daną bibliotekę jest aktywny, czyli nie znajduje się w komentarzu.

- Skrypt musi być idiotoodporny, to jest, ten plik mógł ktoś przed wami zmodyfikować, także proszę wziąć poprawkę na to aby pokryć różnego rodzaju edge case'y.