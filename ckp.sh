#!/bin/bash

############################################################
#                                                          #
#              Converts Krita documents to PDF             #
#                                                          #
#                      Version 1.0.0                       #
#                                                          #
#  Requires ImageMagick.                                   #
#                                                          #
#  2019 by Vivien Richter <vivien-richter@outlook.de>      #
#                                                          #
#  License: GPL v3                                         #
#                                                          #
############################################################

# Prepare
mkdir extractedKritaDocuments

# Extract
for kritaDocument in *.kra
do
	unzip -p "$kritaDocument" mergedimage.png > extractedKritaDocuments/"$kritaDocument".png
done

# Convert and merge into PDF
cd extractedKritaDocuments
convert $(ls | sort -g) ../all.pdf
cd ..

# Clean up
rm -r extractedKritaDocuments
