#lang racket/base

;; Format the reports database as a table

(require (prefix-in html: scribble/html)
         racket/match
         (only-in racket/string string-join))

;; The reports database
(require "../db/db.rkt")

(provide table-of-reports)

;; ------------------------------------------------------------

(define (table-of-reports db)

  (html:table
   (html:thead
    (html:tr
     (html:th 'class: "right" "Nº")
     (html:th 'class: "left"  "Title")
     (html:th 'class: "left"  "Authors")
     (html:th 'class: "right" "Date")
     ))
   (html:tbody
    (for/list ([i (in-list (reverse (hash-keys the-reports)))])
      (let ([rprt (hash-ref the-reports i)])
        (html:tr
         (html:td 'class: "right" (format "~a" i))
         (html:td
          (html:a 'href: (string-append "https://doi.org/" (report-doi rprt))
                  (format "~a" (report-title rprt))))
         (html:td                 (string-join (report-author-names rprt) ", "))
         (html:td 'class: "right" (format-report-date (report-date rprt)))
         ))))))

(define (format-report-date dt)
  (match dt
    [(list yr)
     (format "~a" yr)]
    [(list yr mn)
     (let ([fmt (if (< mn 10) "~a-0~a" "~a-~a")])
       (format fmt yr mn))]
    [(list yr mn _)
     (let ([fmt (if (< mn 10) "~a-0~a" "~a-~a")])
       (format fmt yr mn))]))
