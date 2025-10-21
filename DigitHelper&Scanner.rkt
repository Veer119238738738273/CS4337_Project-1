#lang racket
(define (digit? ch)
  (and (char>? ch #\0) (char<? ch #\9))) ;

(define (take-while pred cs)
  (let loop ([xs cs] [acc '()])
    (cond
      [(and (pair? xs) (pred (car xs)))
       (loop (cdr xs) (cons (car xs) acc))]
      [else (values (reverse acc) xs)])))