#lang racket
(provide no-leftover? evaluate-line)
(require "eval_core.rkt" "whiteSpace.rkt")

(define (no-leftover? cs)
  (null? (skip-ws cs)))

(define (evaluate-line s hist)
  (define res (eval-expr (string->list s) hist))
  (define value (first res))
  (define rest  (second res))
  (unless (no-leftover? rest) (error 'parse "trailing text"))
  (list value 'ok))
