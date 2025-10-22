#lang racket
(provide apply-bin apply-un debug-op?)

(define (debug-op? sym)
  (member sym '(+ * / -)))

(define (apply-bin op a b)
  (cond [(eq? op '+) (+ a b)]
        [(eq? op '*) (* a b)]
        [(eq? op '/) (/ a b)]
        [else (error 'apply-bin "unknown op")]))

(define (apply-un op a)
  (cond [(eq? op '-) (- a)]
        [else (error 'apply-un "unknown unary op")]))
