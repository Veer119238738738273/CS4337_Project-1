#lang racket
(provide eval-number eval-dollar eval-token-id)
(require "ParseAndList.rkt" "history.rkt")

(define (eval-token-id cs)
  (parse-int/list (cdr cs)))

(define (eval-number cs hist)
  (define p (parse-int/list cs))
  (list (first p) (second p)))