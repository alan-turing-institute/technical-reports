% Instructions for editors: Template
% James Geddes
% March 2024

## Overall process

- [ ] Add one to the highest-numbered technical report so far to
	  obtain the new report number, `NNN`.
   
- [ ] Save the submitted report in OneDrive, under `as-received/NNN`.

      If any edits are to be made, make these in
      `in-progress/NNN`. The final version -- with cover sheet --
      should be saved in `as-published/NNN`.
   
- [ ] Generate a new cover sheet (see below). 


## To generate a new cover sheet

1. Add the metadata to the reports database

2. In `db/` run `make cover number=NNN`(see the README there for
   instructions).

3. 

## To publish a new report

1. Edit `main.md` to add the report to the catalogue table. Add the
   abstract and pdfs (TODO: WHERE?). 

2. Run `make site` and ensure no errors. (This will *not* publish a
   new version yet.) 

3. When you are happy, commit the changes to `main`. It is fine to
   make several commits. When you are done, make a new tag with the
   new document's accession number. 
   
4. Merge `main` into ``github-pages-publish`. This *will* publish the
   updates.
   
