#lang racket/base

;; Emit, on standard out, an RSS feed generated from the report database

(require racket/contract
         (only-in racket/string string-join)
         racket/match
         splitflap)

;; The reports database
(require "../db/db.rkt")

(define the-tag-uri
  (mint-tag-uri "turing.ac.uk" "2024" "technical-reports"))

;; Why am I rolling my own date printer? I don't know
(define (ensure-two-digits num)
  (let ([fmt (if (< num 10) "0~a" "~a")])
    (format fmt num)))

(define (format-report-date dt)
  (match dt
    [(list yr)
     (format "~a-01-01" yr)]
    [(list yr mn)
     (format "~a-~a-01" yr (ensure-two-digits mn))]
    [(list yr mn dt)
     (format "~a-~a-~a" yr (ensure-two-digits mn) (ensure-two-digits dt))]))

(define (feed-item-of-report n rprt)
  (feed-item
   (append-specific the-tag-uri (format "~a" n))
   "https://www.turing.ac.uk/news/technical-reports"
   (report-title rprt)
   (person "James Geddes" "jgeddes@turing.ac.uk")
   (infer-moment (format-report-date (report-date rprt)))     ; Publication date
   (infer-moment "")                     ; Update data (which is "now")
   `(report
     (number  ,(format "~a" n))
     (title   ,(report-title rprt))
     (authors ,(string-join (report-author-names rprt) ", "))
     (date    ,(format-report-date (report-date rprt)))
     (doi     ,(report-doi rprt)))))

(display
 (express-xml
  (feed
   the-tag-uri
   "https://www.turing.ac.uk/news/technical-reports"
   "Turing Technical Reports"
   (for/list ([n (in-list (reverse (hash-keys the-reports)))])
     (let ([rprt (hash-ref the-reports n)])
       (feed-item-of-report n rprt))))
  'rss
  "https://alan-turing-institute.github.io/technical-reports/feed.rss"))

