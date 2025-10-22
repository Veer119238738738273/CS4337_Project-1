#lang racket
(provide starts-negative-literal?)
(require "whiteSpace.rkt" "scanner.rkt")

(define (starts-negative-literal? cs)
  (let* ([cs0 (skip-ws cs)])
    (and (pair? cs0)
         (char=? (car cs0) #\-)
         (let ([after (skip-ws (cdr cs0))])
           (and (pair? after) (digit? (car after)))))))
