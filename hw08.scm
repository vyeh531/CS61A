(define (my-filter pred s) 
  (if (null? s)
    s
    (if (pred (car s))
      (cons (car s) (my-filter pred (cdr s)))
      (my-filter pred (cdr s))))
)

(define (interleave lst1 lst2) 
  (if (null? lst1) lst2
      (cons (car lst1) (interleave lst2 (cdr lst1)))  
  )
)

(define (accumulate joiner start n term)
  (if (< n 1) start
      (accumulate joiner (joiner start (term n)) (- n 1) term))
)

(define (no-repeats lst) 
  (if (null? lst) lst
      (cons (car lst)
            (no-repeats (my-filter (lambda (x) (not (= x (car lst))))
            lst))
      )
  )
)
