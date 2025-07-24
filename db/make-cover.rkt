#! /usr/bin/env racket
#lang racket/base

;; Read the reports database (from standard input) and emit a LaTeX
;; driver file (on standard output) with the required metadata

(require (only-in racket/string string-join string-replace)
         racket/match
         racket/cmdline
         racket/date)

;; Load the reports database
(require "db.rkt")

(module+ main
  (define report-number
    (command-line #:args (report-number) (string->number report-number)))
  (make-latex-from-report (hash-ref the-reports report-number)))

;; ------------------------------------------------------------

(define (make-latex-from-report report)
  ;; read-reports reads from standard in by default
  (date-display-format 'iso-8601)
  
  (printf #<<EOS
% The contents of this file were automatically generated 
% from the data in the reports database
% Creation date: ~a
\newcommand{\reportNumber}{~a}
\newcommand{\reportTitle}{~a}
\newcommand{\reportAuthors}{~a}
\newcommand{\reportAcknowledgment}{~a}
\newcommand{\reportPublicationDate}{~a}
\newcommand{\reportCopyrightDate}{~a}
\newcommand{\reportDOI}{~a}
\input{cover.tex}
EOS
          (date->string   (current-date) #t)
          (report-number  report)
          (report-title   report)
          (format-authors (report-author-names report))
          (format-ack     (report-maybe-ack report))
          (format-date    (report-date report))
          (format-date    `(,(car (report-date report))))
          (report-doi     report)))

(define (format-authors authors)
  (let ([n (length authors)]
        [authors (map prevent-line-break authors)])
    (cond
      [(< n 3) (string-join authors " and ")]
      [else    (string-join authors ", " #:before-last ", and~")]
      )))

(define (format-date dt)
  (match dt
    [(list yr) (format "~a" yr)]
    [(list yr mn) (format "~a ~a" (month-of-year mn) yr)]
    [(list yr mn dy) (format "~a ~a ~a" dy (month-of-year mn) yr)]))

;; If there is an acknowledgment, add the required vertical space
;; TODO: This should really be in the LaTeX file
(define (format-ack maybe-ack)
  (if maybe-ack
      (string-append maybe-ack "\\medskip")
      ""))

(define (month-of-year mn)
  (vector-ref *months* (- mn 1)))

(define *months* #("January" "February" "March"
                   "April"   "May"      "June"
                   "July"    "August"   "September"
                   "October" "November" "December"))

;; Replace spaces in an author's name with non-breaking spaces
(define (prevent-line-break author)
  (string-replace author " " "~"))




