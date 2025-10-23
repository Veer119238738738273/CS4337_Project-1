#lang racket
(provide eval-expr)

(require "arith.rkt"       
         "literal.rkt"     
         "whiteSpace.rkt" 
         "negcheck.rkt"    
         "scanner.rkt")    

(define (eval-bin op cs hist)
  (define e1 (eval-expr cs hist))
  (define v1 (first e1))
  (define r1 (second e1))
  (define e2 (eval-expr r1 hist))
  (define v2 (first e2))
  (define r2 (second e2))
  (list (apply-bin op v1 v2) r2))

(define (eval-un op cs hist)
  (define e1 (eval-expr cs hist))
  (define v1 (first e1))
  (define r1 (second e1))
  (list (apply-un op v1) r1))

(define (eval-expr cs hist)
  (let* ([cs0 (skip-ws cs)])
    (if (null? cs0)
        (error 'parse "unexpected end of input")
        (let ([ch (car cs0)])
          (cond
            [(char=? ch #\+) (eval-bin '+ (cdr cs0) hist)]
            [(char=? ch #\*) (eval-bin '* (cdr cs0) hist)]
            [(char=? ch #\/) (eval-bin '/ (cdr cs0) hist)]
            [(char=? ch #\-) (if (starts-negative-literal? cs)
                                 (eval-number cs hist)           
                                 (eval-un '- (cdr cs0) hist))]   
            [(char=? ch #\$) (eval-dollar cs hist)]              
            [(digit? ch) (eval-number cs hist)]                 
            [else (error 'parse "invalid token")])))))
