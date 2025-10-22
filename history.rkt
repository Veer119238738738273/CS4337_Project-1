#lang racket
(provide history-get-by-id result-id history-empty? history->vector)

(define (history-empty? hist) (null? hist))

(define (history->vector hist)
  (list->vector hist))

(define (history-get-by-id hist n)
  (define vec (history->vector hist))
  (vector-ref vec (sub1 n)))

(define (result-id hist)
  (add1 (length hist)))
