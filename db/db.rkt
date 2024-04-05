#lang racket/base

(require racket/contract
         racket/match)

;; Provides the reports database and some utilities 
;; Assumes that the reports database is a file
;; called db.sexp in the same directory as this module

;; WARNING: Very little error-checking is done! A malformed database
;; file will likely result in an unhelpful error message.

;; The database of reports
(provide
 (contract-out
  (db      (hash/c exact-nonnegative-integer? report?))))

;; Utilities
(provide
 (contract-out
  (report? (-> any boolean?))
))


(define report? (hash/c symbol? any/c))

(define (get-report-field fld)
  (λ (rprt)
    (hash-ref rprt fld)))

(define report-number (get-report-field 'number))
(define report-title (get-report-field 'title))
(define report-authors (get-report-field 'authors))
(define report-author-names #f)
(define report-date #f)
(define report-date-printable #f)
(define report-doi (get-report-field 'doi))
(define report-keywords (get-report-field 'keywords))

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
(define/contract (parse-record flds)
  (-> any/c report?) 
  (match flds
    [(list-no-order
      (list 'number  (? exact-nonnegative-integer? n))
      (list 'title   (? string? t))
      (list 'authors (list (? string? as) ...))
      (list 'date    (list (? exact-nonnegative-integer? d) ...)))
     (report n t as d)]
    [_
     (raise-user-error "Invalid record found." flds)]))


