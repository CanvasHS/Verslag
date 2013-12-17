#!/bin/sh
cd /home/lennart/programming/OWP/Verslag

while inotifywait -r -e modify /home/lennart/programming/OWP/Verslag; do
  pdflatex verslag.tex
done
