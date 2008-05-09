(in-package :com.nklein.util.general)

;
; pretty much directly from here:
;     http://lib.store.yahoo.net/lib/paulgraham/onlisp.lisp
;

(defmacro aif (test-form then-form &optional else-form)
    `(let ((ait ,test-form))
        (if ait ,then-form ,else-form)))

(defmacro awhen (test-form &body body)
    `(aif ,test-form (progn ,@body)))

(defmacro awhile (expr &body body)
    `(do ((ait ,expr ,expr)
          ((not ait))
        ,@body)))

(defmacro acond (&rest clauses)
    (if (null clauses)
        nil
        (let ((cl1 (car clauses))
              (sym (gensym)))
            `(let ((,sym ,(car cl1)))
                (if ,sym
                    (let ((ait ,sym)) ,@(cdr cl1))
                    (acond ,@(cdr clauses)))))))

(defmacro aand (&rest args)
    (cond ((null args) t)
          ((null (cdr args)) (car args))
          (t `(aif ,(car args) (aand ,@(cdr args))))))
