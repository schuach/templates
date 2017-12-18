#!/bin/bash
# Dieses Script kombiniert einzelne Dateien aus dem Hochschulschriften-Workflow
# zu einer Eingabedatei für Alma

# bind header to HEAD
read -d '' HEAD <<EOF
<?xml version="1.0" encoding="UTF-8" ?>
<marc:collection xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
EOF

# bind footer to FOOT
FOOT='</marc:collection>'

# read contents of all files to variable BODY
BODY=`sed -s -e '1,5d' \
           -e '$d' \
           -e '/^.*tag="008"/s/[a-z]m/ m/' \
           *.xml`

# combine to one file
echo -e "$HEAD\n$BODY\n$FOOT" > out.xml
