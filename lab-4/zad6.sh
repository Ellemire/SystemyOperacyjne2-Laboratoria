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
# Zadanie 6.
# Plik `dodatkowe/ss-tulpn` zawiera wynik przykładowego uruchomienia komendy
# `ss -tulpn` – proszę na jego podstawie określić numery portów, na których
# jakiś proces nasłuchuje na połączenia przychodzące z zewnątrz w sieci IPv4*.
# Wyświetlić same numery portów, każdy w nowej linii.
# (* – chodzi o wpisy, zawierające adres 0.0.0.0 w kolumnie 5).
#

awk '$5 ~ /0\.0\.0\.0:/ {split($5, a, ":"); print a[2]}' dodatkowe/ss-tulpn | sort -u #
# Netid    State      Recv-Q     Send-Q          Local Address:Port          Peer Address:Port
# udp      UNCONN     0          0                     0.0.0.0:48249              0.0.0.0:*        users:(("avahi-daemon",pid=1897,fd=14))
# udp      UNCONN     0          0               127.0.0.53%lo:53                 0.0.0.0:*        users:(("systemd-resolve",pid=2157,fd=12))
# udp      UNCONN     0          0                     0.0.0.0:68                 0.0.0.0:*        users:(("dhclient",pid=2276,fd=6))