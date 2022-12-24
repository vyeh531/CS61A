(define-macro
 (if-macro condition if-true if-false)
 (list 'if condition if-true if-false))

;scm> (or-macro (print 'bork) (/ 1 0))
;bork
(define-macro (or-macro expr1 expr2)
  `(let ((v1 ,expr1))
     (if v1
         v1
         ,expr2)))


(define (replicate x n)
  (if (= n 0) nil
  (cons x (replicate x (- n 1)))))

;scm> (repeat-n (print '(resistance is futile)) 3) -> (begin (print '(resistance is futile))
;(resistance is futile)
;(resistance is futile)
;(resistance is futile)
(define-macro (repeat-n expr n)
  (cons `begin (replicate expr (eval n))))

(define
 (list-of map-expr for var in lst if filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
  ; lst -> (quote(3 4 5))
)

;scm> (list-of-macro (* x x) for x in '(3 4 5) if (odd? x))
;(9 25)
(define-macro (list-of-macro map-expr
                             for
                             var
                             in
                             lst
                             if
                             filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)
