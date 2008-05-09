(defpackage :com.nklein.util.general
    (:use :cl)
    (:export
        ;; from array-things
            :make-compatible-array
        ;; from listy-things
            :proper-list-p
            :equal-from-less-than
            :sequence-comparator
        ;; from random
            :random-gaussian
        ;; from with-argtypes
            :with-argtypes
            :defun-at :flet-at :labels-at :lambda-at
            :let-at :let-at*
            :do-at :do-at*
        ))
