#lang racket/base

;; Read the reports database (from standard input) and emit a LaTeX
;; file with the required metadata

(require "reports.rkt")


(define (make-latex-from-report n)
  ;; read-reports reads from standard in by default
  (define *the-reports* (read-reports))

  (define *the-report* (find-report n))
  
  (printf #<<EOS
% This file is a template
% The contents are automatically generated for a specific report
% from the data in the reports database
\newcommand{\reportNumber}{~a}
\newcommand{\reportTitle}{~a}
\newcommand{\reportAuthors}{Isaac Asimov}
\newcommand{\reportPublicationDate}{1948}
\newcommand{\reportCopyrightDate}{2024}
EOS
          ))




(module+ main

  (with-input-from-file "db.sexp"
    (λ () (make-latex-from-report 1)))
  )
