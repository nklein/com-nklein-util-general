(defpackage :com.nklein.util.general
    (:use :cl)
    (:export
        ;; from anaphora
            ait
            aif
            awhen
            awhile
            acond
            aand
        ;; from array-things
            make-compatible-array
        ;; from listy-things
            proper-list-p
            equalp-from-lessp
            sequence-lessp
        ;; from random
            random-gaussian
        ;; from with-argtypes
            with-argtypes
            defun-at flet-at labels-at lambda-at
            let-at let-at*
            do-at do-at*
        ))
