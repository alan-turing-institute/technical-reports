ifndef number		
$(error Usage: make cover number=NNN)
endif

.PHONY : cover

cover: $(number).pdf

$(number).pdf: db.sexp make-cover.rkt cover.tex $(number).tex

$(number).tex:
	./make-cover.rkt $(number) < db.sexp > $@
	pdflatex -jobname $(number) -pdf $@
	pdflatex -jobname $(number) -pdf $@
