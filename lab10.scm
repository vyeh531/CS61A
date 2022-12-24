(define (over-or-under num1 num2)
	(cond ((< num1 num2) (print '-1))
		  ((= num1 num2) (print '0))
		  (else          (print '1)))
)

(define (make-adder num) 
	(lambda (inc) (+ num inc))
)

(define (composed f g) 
	(lambda (x) (f(g x)))
)

(define lst 
	(cons (cons 1 nil) (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil))))
)

(define (duplicate lst) 
	(cond ((null? lst)
         '())
        (else
         (cons (car lst) (cons (car lst) (duplicate (cdr lst))))))
)
