#lang racket
(provide parse-int/list)

(require "whiteSpace.rkt" 
         "scanner.rkt")    

(define (parse-int/list cs)
  (let* ([cs0   (skip-ws cs)]                            
         [neg?  (and (pair? cs0) (char=? (car cs0) #\-))] 
         [after (if neg? (skip-ws (cdr cs0)) cs0)])        
    (unless (and (pair? after) (digit? (car after)))   
      (error 'parse "expected integer"))
    (define-values (digits rest) (take-while digit? after)) 
    (define token (list->string (append (if neg? (list #\-) '()) digits)))
    (define n (string->number token))
    (unless (and n (integer? n)) (error 'parse "bad integer"))
    (list (exact-round n) rest)))
