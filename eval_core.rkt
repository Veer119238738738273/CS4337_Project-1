#lang racket
(provide eval-expr eval-bin eval-un)
(require "arith.rkt" "literal.rkt" "whiteSpace.rkt" "negcheck.rkt" "scanner.rkt")

(define (eval-bin op cs hist eval-expr)
  (define e1 (eval-expr cs hist))
  (define e2 (eval-expr cs hist))
  (list (apply-bin op (first e1) (first e2)) (second e2)))

(define (eval-un op cs hist eval-expr)
  (define e1 (eval-expr cs hist))
  (list (apply-un op (first e1)) (second e1)))

(define (eval-expr cs hist)
  (cond
    [(char=? (car cs) #\+) (eval-bin '+ (cdr cs) hist eval-expr)]
    [(char=? (car cs) #\*) (eval-bin '* (cdr cs) hist eval-expr)]
    [(char=? (car cs) #\/) (eval-bin '/ (cdr cs) hist eval-expr)]
    [(char=? (car cs) #\-) (eval-un '- (cdr cs) hist eval-expr)] 
    [(char=? (car cs) #\$) (eval-dollar cs hist)]
    [(digit? (car cs)) (eval-number cs hist)]
    [else (error 'parse "invalid token")]))
