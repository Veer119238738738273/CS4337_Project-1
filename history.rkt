#lang racket
(provide history-get-by-id result-id)

(define (history-get-by-id hist n)
  (cond
    [(or (<= n 0) (> n (length hist))) (error 'history "bad id")]
    [else (list-ref (reverse hist) (sub1 n))]))

(define (result-id hist)
  (add1 (length hist)))
