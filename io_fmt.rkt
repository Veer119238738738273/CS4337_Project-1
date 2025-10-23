#lang racket
(provide print-result print-error)

(define (print-result id value)
  (display id) (display ": ")
  (display (real->double-flonum value))
  (newline))

(define (print-error)
  (displayln "Error: Invalid Expression"))
