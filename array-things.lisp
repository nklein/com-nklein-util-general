(in-package :com.nklein.util.general)

(defun make-compatible-array (aa)
    (make-array (length aa) :element-type (array-element-type aa)))
