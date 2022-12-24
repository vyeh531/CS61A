;scm> (when (= 1 0) ((/ 1 0) 'error))
;okay

;scm> (when (= 1 1) ((print 6) (print 1) 'a))
;6
;1
;a
(define-macro (when condition exprs)
  `(if ,condition
      (begin ,@exprs)
      'okay)
)

(define-macro (switch expr cases)
  (cons 'cond
        (map (lambda (case)
                (cons `(eqv? ,expr ',(car case)) (cdr case)))
             cases))
)
