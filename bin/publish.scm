;; Generate all dynamic parts of the website:
;; - generate html from copy text
;; - generate table of reports from database

;; Read standard input into a list of records. Each record is an
;; association list of (symbol? . any?)

(use-modules (ice-9 ports)
	     (ice-9 match)
	     (srfi srfi-9)) ; records

(define-record-type <report>
  (make-report number title authors date)
  report?
  (number  report-number)
  (title   report-title)
  (authors report-authors)
  (date    report-date))

;; Read datums from standard in
;; Each datum must be of the form (report ...)
;; Returns a list of datums

(define (read-reports)
  (let loop ([next-record (read)]
	     [reports-so-far '()])
    (match next-record
     [(? eof-object?) reports-so-far]
     [('record fields)
      (write (parse-record next-record))
      (display "\n\n")
      (loop (read))])))

(display "Done!\n")







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
  (when (not
	 (and (pair? fld)
	      (symbol? (car fld))))
    (error "Expected a record field" fld))

  (let ([field-name  (car fld)]
	[field-value (cadr fld)])
    (let ([expectation (assoc field-name *record-type-fields*)])
      (unless expectation
	(raise-exception 'unknown-field-name))
      (cons field-name ((cadr expectation) field-value)))))

;; Parse a record from the database and return an association list of
;; fields

(define (parse-record-fields fields)
  (map expect-field fields))

(define (parse-record r)
  (cond
   [(and (list? r)
	 (eq? (car r) 'report))
    (parse-record-fields (cdr r))]
   [else
    (error "Expected a report record." r)]))

;; ------------------------------------------------------------


