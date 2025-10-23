#lang racket
(provide maybe-prompt repl)
(require "handle_line.rkt" "mode.rkt")

(define (maybe-prompt)
  (when interactive?
    (display "> ") (flush-output)))
