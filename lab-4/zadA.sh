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
# Zadanie 10.
# Plik `dodatkowe/listaSluchaczy_E07-19x.csv` odwzoruje listę studentów
# zapisanych na kurs, którą prowadzący może pobrać z systemu Edukacja.CL
# (co do struktury, z poprawionym już kodowaniem). Proszę wygenerować
# adresy e-mail do wszystkich słuchaczy, wiedząc, iż numery albumów
# znajdują się w drugiej kolumnie od pewnego miejsca w pliku, zaś
# numer indeksu stanowi 6 ostatnich znaków z zapisanego numeru albumu.
# Format każdego adresu e-mail to {nr-indeksu}@student.pwr.edu.pl.
# Każdy adres e-mail wyświetlać w osobnej linii, nie wyświetlać nic ponadto.
#

awk -F';' '$2 ~ /_[0-9]{9}/ {print substr($2, length($2)-5, 6) "@student.pwr.edu.pl"}' dodatkowe/listaSluchaczy_E07-19x.csv

# Lp.;Nr albumu;Nazwisko;Imiona;Rok;Semestr;Przedmiot kształcenia;Ocena (np. 3.0);Data (RRRR-MM-DD);Komentarz
# 1;_018123456;Adamska;Felicja Marta;3;6;PO-W04-INF-INT- -ST-Ii-WRO-ITT- - - - -PWR1-DWU;;;;
# 2;_018123457;Adamski;Jakub Adrian;3;6;PO-W04-INF-IGM- -ST-Ii-WRO-ITT- - - - -PWR1-DWU;;;;
# 3;_013123458;Baran;Maja Zofia;3;6;PO-W04-INF-INS- -ST-Ii-WRO-ITT- - - - -PWR1-DWU;;;;