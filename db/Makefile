ifndef number		
$(error Usage: make cover number=NNN)
endif

.PHONY : cover

cover: $(number).pdf

$(number).pdf: db.sexp make-cover.rkt cover.tex
	./make-cover.rkt $(number) < db.sexp > $(number).tex
	xelatex -jobname $(number) -pdf $(number).tex
	xelatex -jobname $(number) -pdf $(number).tex
