;; THE ALAN TURING INSTITUTE TECHNICAL REPORTS SERIES DATABASE
;;
;; (c) The Alan Turing Institute 2024
;; Written by James Geddes <jgeddes@turing.ac.uk>
;; This file is openly licensed under CC BY-SA 4.0 

;; This file contains the metadata for all technical reports. The
;; format is a sequence of s-expressions, each of which describes one report.
;; It was inspired by the Cambridge Laboratory Technical Reports database.

;; Format
;; ------
;;
;; Each report is a list of the form
;; (report
;;   (<field-name> <field-value>)
;;   ... )
;;
;; Note that each field is list of two elements (not a pair!)
;; The <field-value> may be an atomic value or a list, depending on the field.
;;
;; The possible <field-names> are:
;;
;; number: a natural number
;; title: a string
;; authors: a list of authors, where an author is either a string (the
;;          name) or a list of a string followed by identifiers.
;; date: a list of up to three numbers, being the year, month, and day
;; keywords: a list of strings
;; doi: a string

;; TODO
;; - add abstracts
;; - add copyright date as an optional field

(report
 (number   1)
 (title    "Machine translation quality estimation literature review")
 (authors  (("Joanna Knight"   (orcid "https://orcid.org/0000-0002-2558-2815"))
	    ("Radka Jersakova" (orcid "https://orcid.org/0000-0001-6846-7158"))
	    ("James Bishop"    (orcid "https://orcid.org/0009-0003-0406-3367"))))
 (date     (2024 04))
 (keywords ("machine translation"
	    "quality estimation"
	    "pretrained language models"
	    "large language models"
	    "uncertainty quantification"
	    "explainable machine learning"))
 (doi       "10.5281/zenodo.10931558"))

;; (report
;;  (number  2)
;;  (title   "Autonomous cyber defence: Beyond games?")
;;  (authors ("Chris Hicks" "Vasilios Mavroudis"))
;;  (date    (2024 04))

