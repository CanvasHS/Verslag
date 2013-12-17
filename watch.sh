#!/bin/sh

while inotifywait -r -e modify .; do
  pdflatex verslag.tex
done
