## Usage: make report number=n

report: $(number).pdf

$(number).pdf: db.sexp make-report.rkt cover-metadata.tex

cover-metadata.tex:
	make-report $(number) < db.sexp > $@

