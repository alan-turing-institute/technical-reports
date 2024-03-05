% Instructions for editors
% James Geddes
% March 2024

## Introduction

The current process is very manual. Once we have more than a handful
of reports, I intend to write some scripts to automate much of the
process.

## To publish a new report

1. Edit `main.md` to add the report to the catalogue table. And the
   abstract and pdfs (TODO: WHERE?). 

2. Run `make site` and ensure no errors. (This will *not* publish a
   new version yet.) 

3. When you are happy, commit the changes to `main`. It is fine to
   make several commits. When you are done, make a new tag with the
   new document's accession number. 
   
4. Merge `main` into ``github-pages-publish`. This *will* publish the
   updates.
   
