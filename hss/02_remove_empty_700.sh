#!/bin/bash

# entfernt 700er-Felder, wenn kein Subfeld a vorhanden ist
sed -i'data/*' -e '
/tag="700"/ {
    N
    /\n.*code="4"/ {
                N
                /\n.*\/marc:datafield/ d
                   }
            }
' *.xml
