#!/bin/sh

# Makes this script executable
sudo chmod +x pdflinkgenerator.sh

# Takes every entry from listed man pages and saves just the names into manpagelist.csv 
man -k .|awk '{$0=$1};1' > manpagelist.csv

# Here we use the data inside the manpagelist.csv file to generate the PDFs using the names sotred in the manpagelist.csv file
filename="manpagelist.csv"
while IFS=""; read -r manpagename; do
	echo '<p><a href="manpdf/'$manpagename'.pdf" target="_blank">'$manpagename'</a></p>' >> generatedlinks.html
done < $filename

# We let the user know where the PDFs were saved
echo "Done..."