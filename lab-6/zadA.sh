#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 7
#
# Celem zajęć jest zapoznanie się z wyrażeniami regularnymi, wykorzystując
# przy tym narzędzia awk i grep oraz wszystkie inne, poznane na zajęciach.
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
# Proszę opracować uproszczony konwerter plików z formatu JSON do formatu XML
# i przetworzyć nim plik `dodatkowe/simple.json`. Zakładamy, że wejście stanowi
# zawsze pojedyncza linia, klucze i wartości to proste łańcuchy znaków, złożone
# z liter lub cyfr, pomiędzy cudzysłowami, które są rozdzielone jednym znakiem
# dwukropka i co najmniej jedną spacją, a całe pary klucz-wartość są oddzielone
# od siebie jednym przecinkiem i co najmniej jedną spacją.
#
# Przykład przetworzenia: {"klucz": "wartość"} -> <klucz>wartość</klucz>.
#
# Proszę obsłużyć tworzenie samodomykającego się znacznika (<klucz />), kiedy
# wartość stanowi pusty łańcuch "", a także proszę obsłużyć zagnieżdżenie
# kolejnego zbioru kluczy i wartości.
#


awk '
BEGIN {
    output = ""
    stack_size = 0
}
{
    for (i = 1; i <= NF; i++) {
        word = $i
        next_word = (i < NF) ? $(i+1) : ""
        rest = word

        # "klucz":
        if (match(rest, /\{?"[^"]+":/)) {
            match_text = substr(rest, RSTART, RLENGTH)
            gsub(/[\{"":]/, "", match_text)
            if (match(next_word, /"",/)) {
                output = output "<" match_text " />"
            }
            else {
                stack[++stack_size] = match_text
                output = output "<" match_text ">"
            }
        }

        # "wartość",
        else if (match(rest, /"([^"]+)"}?,?/)) {
            match_text = substr(rest, RSTART, RLENGTH)
            gsub(/["},]/, "", match_text)
            output = output match_text
            
            # Zamknij tag jeśli jest , lub }
            while (match(word, /[,}]/)) {
                if (stack_size > 0) {
                    output = output "</" stack[stack_size] ">"
                    delete stack[stack_size]
                    stack_size--
                }

                sub(/[,}]/, "", word)
            }
        }
    }
}
END {
    print output
}
' dodatkowe/simple.json

