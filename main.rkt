#lang racket
(require "repl_loop.rkt")

(define (main)
  (repl '()))

(module+ main
  (main))