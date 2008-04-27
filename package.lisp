(defpackage :com.nklein.util.general
    (:use :cl)
    (:export
	;; from with-argtypes
	    :with-argtypes
	    :proper-list-p
	    :defun-at :flet-at :labels-at :lambda-at
	    :let-at :let-at*
	    :do-at :do-at*
	))
