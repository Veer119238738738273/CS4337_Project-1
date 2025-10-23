#lang racket

(provide print-result print-error show)

(define (print-result id value)
  (printf "~a: ~a\n" id value))
(define (print-error)
  (displayln "Invalid Expression"))
(define (show msg)
  (displayln msg))


