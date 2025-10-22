#lang racket
(provide apply-bin apply-un)

(define (apply-bin op a b)
  (cond [(equal? op '+) (+ a b)]
        [(equal? op '*) (* a b)]
        [(equal? op '/) (begin
                          (when (zero? b) (error 'eval "divide by zero"))
                          (quotient a b))]
        [else (error 'apply-bin "unknown op")]))

(define (apply-un op a)
  (cond [(equal? op '-) (- a)]
        [else (error 'apply-un "unknown unary op")]))
