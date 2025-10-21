#lang racket
(define (tokenize s)
  (string-split s)) ; wrong for my char-based parser