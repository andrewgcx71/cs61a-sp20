(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests) (map (lambda (n) (append (list first) n)) rests))

(define (zip pairs)
    'replace-this-line)

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (define (helper i lst)
      (cond 
            ( (null? (cdr lst))  (list (list i (car lst))) )
            (else (append (list (list i (car lst))) (helper (+ i 1) (cdr lst))) )
       )
    )
    (cond 
          ((null? s) s)
          (else (helper 0 s))
          )
    )
  ; END PROBLEM 16

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
    ; BEGIN PROBLEM 17
    (cond 
          ( (< total 0) () )
          ( (= total 0) '(()) )
          ( (null? denoms) () )
          ( else (define with_first (list-change (- total (car denoms) ) denoms ))
                 (define without_first (list-change total (cdr denoms) ) )
                 
                 (cond 
                       ( (null? with_first) without_first)
                       ( (null? without_first) (cons-all (car denoms) with_first) )
                       ( else (append (cons-all (car denoms) with_first) without_first))
                         )
                  )
          )
        )
  ; END PROBLEM 17

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         'replace-this-line
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         'replace-this-line
         ; END PROBLEM 18
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           'replace-this-line
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           'replace-this-line
           ; END PROBLEM 18
           ))
        (else
         ; BEGIN PROBLEM 18
         'replace-this-line
         ; END PROBLEM 18
         )))