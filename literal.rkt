#lang racket
(provide eval-number eval-dollar eval-token-id)
(require "ParseAndList.rkt" "history.rkt")

(define (eval-token-id cs)
  (parse-int/list (cdr cs)))

