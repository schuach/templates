#!/bin/bash
# Sortiert die einzelnen Dateien in Verzeichnisse
# Alle gesperrten Arbeiten in Verzeichnis "gesp"
if [ ! -d gesp ]; then
    mkdir gesp
fi

mv $(grep -le 'code="a">Arbeit gesperrt<' *.xml) gesp


# Alle elektronisch nicht zugänglichen Arbeiten in el_nicht_zug
if [ ! -d el_nicht_zug ]; then
    mkdir el_nicht_zug
fi

mv $(grep -le 'code="i">AutorIn stimmte der Freigabe des elektronischen Dokuments nicht zu</marc:subfield>' *.xml) el_nicht_zug

# Alles mit Link in el_zug
if [ ! -d el_zug ]; then
    mkdir el_zug
fi

mv $(grep -le 'tag="856"' *.xml) el_zug
