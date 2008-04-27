(in-package :com.nklein.util.general)

(defun proper-list-p (x)
    (if (consp x)
	(proper-list-p (cdr x))
	(not x)))
