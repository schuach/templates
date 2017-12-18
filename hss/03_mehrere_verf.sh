#!/bin/bash

# Arbeiten mit mehreren Verfasserinnen in mehrere_verf verschieben
if [ ! -d mehrere_verf ]; then
    mkdir mehrere_verf
fi

mv $(grep -le 'tag="700"' *.xml) mehrere_verf
