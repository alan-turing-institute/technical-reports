
;; Read standard input into a list of records. Each record is a
;; <report>.

;; WARNING: Very little error-checking is done! A malformed database
;; file will likely result in an unhelpful error message.


(use-modules (ice-9 ports)
	     (ice-9 match)
	     (srfi srfi-1) ; list utilities
	     (srfi srfi-9) ; records
	     )





(define-record-type <report>
  (make-report number title authors date)
  report?
  (number  report-number)
  (title   report-title)
  (authors report-authors)
  (date    report-date))

;; Read datums from standard input
;; Each datum must be of the form ('report field ...)
;; Returns a list of <report>s

(define (read-reports)
  (let loop ([next-record (read)]
	     [reports-so-far '()])
    (match next-record
      [(? eof-object?) reports-so-far]
      [('report . fields)
       (loop (read) (cons (report-of fields) reports-so-far))]
      [else
       (error "Expected a report." next-record)])))


;; ------------------------------------------------------------
;; Parsing

(define (report-of fields)
  (let ([flds (parse-fields fields)])
    (let ([number  (cadr (assoc 'number flds))]
	  [title   (cadr (assoc 'title flds))]
	  [authors (cadr (assoc 'title flds))]
	  [date    (cadr (assoc 'date  flds))])
      (make-report number title authors date))))

;; fields : a list of ('field-name val1 ...)
;; such that each field-name is unique
(define (parse-fields fields)
  (fold
   (λ (f flds)
     (unless (and (pair? f) (symbol? (car f)))
       (error "Bad field." f))
     (let ([name (car f)]
	   [val (cdr f)])
       (when (assoc name flds)
	 (error "Duplicate field." f))
       (acons name val flds)))
   '()
   fields))

;; ------------------------------------------------------------
;; Main 


(define *reports* (read-reports))

(display *reports*)



