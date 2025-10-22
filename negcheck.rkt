#lang racket

(provide starts-negative-literal? raw-minus?)
(require "scanner.rkt")

(define (raw-minus? ch) (char=? ch #\-))

(define (starts-negative-literal? cs)
  (and (pair? cs)
       (raw-minus? (car cs))
       (digit? (cadr cs))))