#lang racket
(provide no-leftover? evaluate-line)
(require "eval_core.rkt")

(define (no-leftover? cs) #t)

(define (evaluate-line s hist)
  (eval-expr (string->list s) hist))