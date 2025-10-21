#lang racket
(require "mode.rkt"
         "tokenize.rkt"
         "whiteSpace.rkt")

(define (main)
  (displayln "All modules loaded successfully!"))

(module+ main
  (main))