#lang racket/base

(require racket/contract
         racket/match
         racket/runtime-path)

;; Provides the reports database and some utilities 
;; Assumes that the reports database is a file
;; called db.sexp in the same directory as this module

;; WARNING: Very little error-checking is done! A malformed database
;; file will likely result in an unhelpful error message.

;; The database of reports
(provide
 (contract-out
  (the-reports (hash/c exact-nonnegative-integer? report/c))))

;; Utilities
(provide
 (contract-out
  [report-number       (-> report/c exact-nonnegative-integer?)]
  [report-title        (-> report/c string?)]
  [report-author-names (-> report/c (listof string?))]
  [report-date         (-> report/c (listof exact-nonnegative-integer?))]
  [report-doi          (-> report/c string?)]
  [report-keywords     (-> report/c (listof string?))]))

;; ------------------------------------------------------------

(define-runtime-path the-database "db.sexp")

(define report/c (hash/c symbol? any/c))

(define (get-report-field fld)
  (λ (rprt)
    (hash-ref rprt fld)))

(define report-number       (get-report-field 'number))
(define report-title        (get-report-field 'title))
(define report-date         (get-report-field 'date))
(define report-doi          (get-report-field 'doi))
(define report-keywords     (get-report-field 'keywords))

(define (report-author-names rprt)
  (define authors ((get-report-field 'authors) rprt))
  (for/list ([author (in-list authors)])
    (cond
      [(string? author) author]
      [(pair? author)   (car author)])))

;; Read datums from standard input
;; Each datum must be an s-expression of the form
;; ('report ...)
;; report : -> [Hash-of report-number report?]
(define (read-reports)
  (for/hash ([record (in-port read)])
    (match record
      [(list 'report flds ... )
       (let ([rprt (parse-record flds)])
         (values (report-number rprt) rprt))]
      [_
       (raise-user-error "Expected a report record." record)])))


;; Marshall a set of fields into a record
;; Fields may be given in any order
;; A field is ('field-name val ...)
(define (parse-record flds)
  (for/hash ([fld flds])
    ;; Each field is a list of precisely two elements
    (values (car fld) (cadr fld))))


;; ------------------------------------------------------------
;; Read in the reports

(define the-reports (with-input-from-file the-database read-reports))
