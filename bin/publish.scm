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
       (<= (length xs) 3)
       (andmap integer? xs)))

(define (expect-value pred?)
  (λ (x)
    (if (pred? x)
	x
	(raise-exception 'invalid-field-value-type))))

;; ------------------------------------------------------------

(define *record-type-fields*
  `((number  . (,(expect-value integer?)        "integer"))
    (title   . (,(expect-value string?)         "string"))
    (authors . (,(expect-value list-of-string?) "list of string"))
    (date    . (,(expect-value record-date?)    "date"))))

;; expect-field : list? -> pair?
(define (expect-field fld)
  (cond
   [(and ())])
  )

;; Parse a record from the database and return an association list of
;; fields
(define (parse-field fld acc)
  )

(define (parse-record-fields fields)
  (define (parse-field fld acc) 
    ()
    
    )
  

  )

(define (parse-record r)
  (cond
   [(and (list? r)
	 (eq? (car r) 'report))
    (parse-record-fields (cdr r))]
   [else
    (error "Expected a report record.\n" r)]))

;; ------------------------------------------------------------

;; TODO: FIX HARDCODING!

(with-input-from-file "test.sexp"
  (λ ()
    (let loop ([next-record (read)])
      (cond
       [(eof-object? next-record) #t]
       [else
	(display (parse-record next-record))
	(loop (read))]))))

(display "Done!\n")
