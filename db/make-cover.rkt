#! /usr/bin/env racket
#lang racket/base

;; Read the reports database (from standard input) and emit a LaTeX
;; file (on standard output) with the required metadata

(require (only-in racket/string string-join)
         racket/match
         racket/cmdline
         "reports.rkt")



(module+ main
  (define report-number
    (command-line #:args (report-number) (string->number report-number)))
  (make-latex-from-report report-number))


;; ------------------------------------------------------------

(define (make-latex-from-report n)
  ;; read-reports reads from standard in by default
  (define *report* (hash-ref (read-reports) n))
  
  (printf #<<EOS
% This file is a template
% The contents are automatically generated for a specific report
% from the data in the reports database
\newcommand{\reportNumber}{~a}
\newcommand{\reportTitle}{~a}
\newcommand{\reportAuthors}{~a}
\newcommand{\reportPublicationDate}{~a}
\newcommand{\reportCopyrightDate}{~a}
EOS
          (report-number  *report*)
          (report-title   *report*)
          (format-authors (report-authors *report*))
          (format-date    (report-date *report*))
          (format-date    `(,(car (report-date *report*))))))

(define (format-authors authors)
  (let ([n (length authors)])
    (cond
      [(< n 3) (string-join authors " and ")]
      [else    (string-join authors ", " #:before-last ", and ")]
      )))

(define (format-date dt)
  (match dt
    [(list yr) (format "~a" yr)]
    [(list yr mn) (format "~a ~a" (month-of-year mn) yr)]
    [(list yr mn dy) (format "~a ~a ~a" dy (month-of-year mn) yr)]))

(define (month-of-year mn)
  (vector-ref *months* (- mn 1)))

(define *months* #("January" "February" "March"
                   "April" "May" "June"
                   "July" "August" "September"
                   "October" "November" "December"))





