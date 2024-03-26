## Usage:
##   make cover number=n

cover: $(number).pdf

$(number).pdf: db.sexp make-cover.rkt cover.tex cover-metadata.tex

cover-metadata.tex:
	./make-cover.rkt $(number) < db.sexp > $@
	pdflatex -pdf cover.tex
	mv cover.pdf $(number).pdf
