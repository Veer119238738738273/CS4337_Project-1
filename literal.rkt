#lang racket
(provide eval-number eval-dollar)
(require "ParseAndList.rkt" "history.rkt" "whiteSpace.rkt")

(define (eval-number cs hist)
  (let ([p (parse-int/list cs)])
    (list (first p) (second p))))

(define (eval-dollar cs hist)
  (let ([cs0 (skip-ws cs)])
    (unless (and (pair? cs0) (char=? (car cs0) #\$))
      (error 'parse "$ expected"))
    (define p (parse-int/list (cdr cs0)))
    (list (history-get-by-id hist (first p)) (second p))))
