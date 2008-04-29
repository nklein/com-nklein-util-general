(in-package :com.nklein.util.general)

(defun random-gaussian (&optional state)
    "Return two normally-distributed Gaussian random variables using Box-Muller"
    (let ((u1 (random 1.0d0))
	  (u2 (random 1.0d0)))
	(let ((mag (sqrt (* (- 2.0d0) (log u1))))
	      (ang (* 2.0d0 pi u2)))
	    (values (* mag (sin ang)) (* mag (cos ang))))))
