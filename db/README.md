## Generate a cover sheet from the report database

In this directory, run

```bash
./make-cover.rkt NNN < db.sexp > cover-metadata.tex
```

That will extract report number NNN from the database and write a
LaTeX file to `cover-metadata.tex`.

Then run
```bash
pdflatex -pdf cover.tex
```

The file `cover.tex` will include the previously written
`cover-metadata.tex` as it is run. (You may need to do this a few
times to ensure the logo is added -- I don't know why.)

Finally, move the resulting file, `cover.pdf` to `NNN.pdf` in the
`coversheets/` subdirectory. 
