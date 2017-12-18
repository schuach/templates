#!/bin/bash

# ersetzt die Leerzeichen aus den Dateinamen mit Underscores
for i in *.xml
do
    mv "$i" `echo "$i" | sed 's/ /_/g'`
done
