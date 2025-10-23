#lang racket
(provide maybe-prompt repl)
(require "handle_line.rkt"
         "mode.rkt")

(define (maybe-prompt)
  (display "> ") (flush-output))

(define (repl hist)
  (maybe-prompt)
  (define line (read-line))
  (unless (eof-object? line)
    (handle-line line hist)    
    (repl hist)))             
