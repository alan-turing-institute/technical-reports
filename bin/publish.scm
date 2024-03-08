;; Generate all dynamic parts of the website:
;; - generate html from copy text
;; - generate table of reports from database

;; Read database file, validate each record, and produce an internal
;; representation. The internal representation is a list of
;; reports, where each report is an association list.

(use-modules (ice-9 ports))

;; True if (map p xs) is a list of #t
(define (andmap p xs)
  (if (null? xs)
      #t
      (let loop ([xs xs])
	(cond
	 [(null? (cdr xs)) (p (car xs))]
	 [else
	  (let ([rest (cdr xs)])
	    (and (p (car xs)) (loop rest)))]))))

(define (list-of-string? xs)
  (and (list? xs)
       (andmap string? xs)))

;; A record-date? is a list of integer? of length at most 3
(define (record-date? xs)
  (and (list? xs)
       (or (null? (cdr xs))
	   (null? (cddr xs))
	   (null? (cdddr xs)))
       (andmap integer? xs)))

(define (expect pred?)
  (λ (field)
    (if (pred? field)
	field
	(raise-exception 'invalid-field-type))))

;; ------------------------------------------------------------

(define *record-type-fields*
  `((number  . (,(expect integer?)        "integer"))
    (title   . (,(expect string?)         "string"))
    (authors . (,(expect list-of-string?) "list of string"))
    (date    . (,(expect record-date?)    "date"))))

;; Parse a record from the database and return an association list of
;; fields
(define (parse-record-fields fs)
  fs
  )

(define (parse-record r)
  (cond
   [(and (list? r)
	 (eq? (car r) 'report))
    (parse-record-fields (cdr r))]
   [else
    (error "Expected a new record.\n" r)]))

;; ------------------------------------------------------------

;; TODO: FIX HARDCODING!

(with-input-from-file "test.sexp"
  (λ ()
    (let loop ([next-record (read)])
      (cond
       [(eof-object? next-record) #t]
       [else
	(parse-record next-record)]))))

(display "Done!\n")
