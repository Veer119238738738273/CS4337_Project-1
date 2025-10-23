#lang racket
(provide handle-line)
(require "line_eval.rkt" "io_fmt.rkt" "history.rkt")

(define (handle-line s hist)
  (with-handlers ([exn:fail? (λ (e)
                               (print-error)
                               (cons 0 hist))])   
    (define out (evaluate-line s hist))
    (define value (first out))
    (define id (result-id (cons value hist)))
    (print-result id value)
    (cons value hist)))
