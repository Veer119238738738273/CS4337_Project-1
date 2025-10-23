#lang racket
(provide maybe-prompt repl)
(require "handle_line.rkt" "mode.rkt")

(define (maybe-prompt)
  (when interactive?
    (display "> ") (flush-output)))

(define (repl hist)
  (maybe-prompt)
  (define line (read-line))
  (cond
    [(eof-object? line) (void)]
    [(string=? line "quit") (void)]
    [else (repl (handle-line line hist))]))
