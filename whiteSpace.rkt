#lang racket
(define (skip-ws cs)
  (if (char-whitespace? (car cs))
      (skip-ws (cdr cs))
      cs))