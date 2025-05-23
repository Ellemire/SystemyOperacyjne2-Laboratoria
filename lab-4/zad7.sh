#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 5
#
# Celem zajęć jest nabranie doświadczenia w pracy z mechanizmem łącz
# nienazwanych, wykorzystując przy tym szereg podstawowych narzędzi
# do przetwarzania danych tekstowych.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#

#
# Zadanie 7.
# Odnaleźć w pliku `dodatkowe/ps-aux` proces, który zużywa najwięcej czasu
# procesora (trzecia kolumna). Jako wynik zwrócić numer procesu (druga kolumna)
# oraz po spacji pełną nazwę procesu (wszystko od 11 kolumny do końca wiersza).
#

tail -n +2 dodatkowe/ps-aux | sort -k3 -nr | head -n1 | awk '{print $2, substr($0, index($0,$11))}' #

# pominięcie nagłówka, sortowanie malejąco po 3 kolumie (zużycie CPU), pierwszy wiersz

# USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
# root         1  0.0  0.0 225640  6288 ?        Ss   Apr02   0:37 /sbin/init text
# root         2  0.0  0.0      0     0 ?        S    Apr02   0:01 [kthreadd]
# root         3  0.0  0.0      0     0 ?        I<   Apr02   0:00 [rcu_gp]