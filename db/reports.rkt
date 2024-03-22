#lang racket/base

(require racket/contract
         racket/match)

;; Utilities for accessing the reports database

;; WARNING: Very little error-checking is done! A malformed database
;; file will likely result in an unhelpful error message.

(provide
 (contract-out
  [struct report
    ([number  exact-nonnegative-integer?]
     [title   string?]
     [authors (non-empty-listof string?)]
     [date    (listof exact-nonnegative-integer?)])]))

(provide
 (contract-out
  [read-reports (-> (listof report?))]))

(struct report (number title authors date) #:transparent)

;; Read datums from standard input
;; Each datum must be an s-expression of the form
;; ('report ...)
;; report : -> [List-of report?)
(define (read-reports)
  (for/list ([record (in-port read)])
    (match record
      [(list 'report flds ... ) (parse-record flds)]
      [_
       (raise-user-error "Expected a record." record)])))


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


