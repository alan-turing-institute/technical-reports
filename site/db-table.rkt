#lang racket/base

;; Format the reports database as a table

(require (prefix-in html: scribble/html)
         racket/match
         (only-in racket/string string-join)
         "../db/reports.rkt")

(provide table-of-reports)

;; ------------------------------------------------------------

(define (table-of-reports db)
  (define the-reports
    (with-input-from-file db read-reports))

  (html:table
   (html:thead
    (html:tr
     (map html:th '("Nº" "Title" "Authors" "Date" "Download"))))
   (html:tbody
    (for/list ([i (in-list (reverse (hash-keys the-reports)))])
      (let ([rprt (hash-ref the-reports i)])
        (html:tr
         (html:td (format "~a" i))
         (html:td (format "~a" (report-title rprt)))
         (html:td (string-join (report-authors rprt) ", "))
         (html:td (format-report-date (report-date rprt)))
         (html:td "")))))))

(define (format-report-date dt)
  (match dt
    [(list yr)
     (format "~a" yr)]
    [(list yr mn)
     (let ([fmt (if (< mn 10) "~a-0~a" "~a-~a")])
       (format fmt yr mn))]
    [(list yr mn dy)
     (let ([fmt (if (< mn 10) "~a-0~a" "~a-~a")])
       (format fmt yr mn))]))
